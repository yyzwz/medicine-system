<template>
<div>
    <Button @click="visible=true" :icon="icon">选择手术</Button>
    <Drawer title="导入手术档案数据" closable v-model="visible" draggable width="800">
        <car>
            <Row>
                <Form ref="huasearchForm" :model="huasearchForm" inline :label-width="70">
                    <Form-item label="姓名">
                        <Input type="text" v-model="huasearchForm.nickname" clearable placeholder="请输入姓名" style="width: 200px" />
                    </Form-item>
                    <Form-item>
                        <Button @click="huahandleSearch" type="primary" icon="ios-search">搜索</Button>
                        <Button @click="huahandleReset">重置</Button>
                    </Form-item>
                </Form>
            </Row>
            <Row v-show="openTip">
                <Alert show-icon>
                    已选择
                    <span class="select-count">{{huaselectCount}}</span> 项
                    <a class="select-clear" @click="huaclearSelectAll">清空</a>
                </Alert>
            </Row>
            <Row>
                <Table :loading="hualoading" border :columns="userColumns" :data="huaData" sortable="custom" @on-sort-change="huachangeSort" @on-selection-change="huashowHuaSelect" ref="table1"></Table>
                <br>
            </Row>
            <Row type="flex" justify="end" class="page">
                <Page :current="huasearchForm.pageNumber" :total="huaTotal" :page-size="huasearchForm.pageSize" @on-change="huachangePage" @on-page-size-change="huachangePageSize" :page-size-opts="[10,20,50]" size="small" show-total show-elevator show-sizer></Page>
            </Row>
            <span style="font-size:28px;color:#f00;">{{selectUserName}}</span><br>
            <Button type="info" @click="saveNow">暂存</Button> &nbsp;
            <Button type="error" @click="clearNow">清空</Button> &nbsp;
            <Button type="primary" @click="huaAddData">从手术档案导入</Button> &nbsp;
            <Button @click="closeWindow">退出</Button>
        </car>
    </Drawer>
</div>
</template>

<script>
import {
    getMedicineList
} from "@/api/index";
export default {
    name: "add",
    components: {},
    props: {
        value: {
            type: Boolean,
            default: false
        },
        data: {
            type: Object
        },
    },
    watch: {
        value(val) {
            this.setCurrentValue(val);
        },
        visible(value) {
            this.$emit("input", value);
        }
    },
    data() {
        return {
            showValue: false,
            visible: this.value,
            title: "",
            submitLoading: false,
            maxHeight: 510,
            form: {},
            formValidate: {},
            roleList: [],
            userColumns: [{
                    type: "selection",
                    width: 55,
                    align: "center",
                    fixed: "left"
                },
                {
                    title: "手术名称",
                    key: "name",
                    minWidth: 100,
                    sortable: true
                },
                {
                    title: "价格",
                    key: "price",
                    minWidth: 140,
                    sortable: true
                },
                {
                    title: "类型",
                    key: "type",
                    minWidth: 140,
                    sortable: true
                },
                {
                    title: "功能主治",
                    key: "efficacy",
                    minWidth: 140,
                    sortable: true
                },
                {
                    title: "数量",
                    key: "number",
                    minWidth: 140,
                    render: (h, params) => {
                        return h("Form", [
                            h("Input", {
                                style: {
                                    marginLeft: "4px",
                                    width: "150px"
                                },
                                props: {
                                    type: "text",
                                    value: params.row.number //使用data中的key
                                },
                                on: {
                                    input: event => {
                                        this.huaData[params.index].number = event; //双向绑定
                                        // console.log(event,this.huaData);
                                    }
                                }
                            }),
                        ]);
                    }
                }
            ],
            isImportHuaData: true,
            huasearchForm: {
                pageNumber: 1,
                pageSize: 10,
                username: ""
            },
            selectHuaList: [],
            selectHuaCount: [],
            huaData: [],
            selectNewData: [],
            saveSelectNewData: [],
            selectUserName: '',
        };
    },
    methods: {
        init() {
            this.getHuaUserList();
        },
        saveNow() {
            var that = this;
            // console.log(that.selectNewData);
            that.selectNewData.forEach(function (e) {
                that.saveSelectNewData.push(e);
            })
            that.selectUserName = '';
            that.saveSelectNewData.forEach(function (e) {
                that.selectUserName += "  " + e.name + " * " + e.number;
            })

        },
        clearNow() {
            this.saveSelectNewData = [];
            this.selectUserName = '';
        },
        huashowHuaSelect(e) {
            // console.log(e);
            this.selectNewData = e;
        },
        setCurrentValue(value) {
            if (value === this.visible) {
                return;
            }
            this.visible = value;
        },
        closeWindow() {
            this.visible = false;
        },
        huahandleSearch() {
            this.huasearchForm.pageNumber = 1;
            this.huasearchForm.pageSize = 10;
            this.getHuaUserList();
        },
        huahandleReset() {
            this.$refs.huasearchForm.resetFields();
            this.huasearchForm.nickname = '';
            this.huasearchForm.pageNumber = 1;
            this.huasearchForm.pageSize = 10;
            this.getHuaUserList();
        },
        huaclearSelectAll() {
            this.$refs.table1.selectAll(false);
        },
        huachangePage(v) {
            this.huasearchForm.pageNumber = v;
            this.getHuaUserList();
            this.huaclearSelectAll();
        },
        huachangePageSize(v) {
            this.huasearchForm.pageSize = v;
            this.getHuaUserList();
        },
        huaAddData() {
            var that = this;
            if (this.selectNewData.length <= 0) {
                this.$Message.warning("您还未选择要从手术档案导入的数据");
                return;
            }
            this.$Modal.confirm({
                title: "确认导入",
                content: "您确认要导入所选的数据?",
                loading: true,
                onOk: () => {
                    // console.log(this.selectNewData);
                    this.$emit("on-change", this.saveSelectNewData);
                    this.$Modal.remove();
                    this.$Message.success("导入成功");
                    this.visible = false;
                }
            })
        },
        getHuaUserList() {
            this.hualoading = true;
            getMedicineList(this.huasearchForm).then(res => {
                this.hualoading = false;
                if (res.success) {
                    this.huaData = res.result.records;
                    this.huaTotal = res.result.total;
                }
            });
        },
    },
    mounted() {
        this.init();
    }
};
</script>

<style lang="less">
.edit-head {
    display: flex;
    align-items: center;
    justify-content: space-between;
    position: relative;

    .back-title {
        color: #515a6e;
        display: flex;
        align-items: center;
    }

    .head-name {
        display: inline-block;
        height: 20px;
        line-height: 20px;
        font-size: 16px;
        color: #17233d;
        font-weight: 500;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .window-close {
        z-index: 1;
        font-size: 12px;
        position: absolute;
        right: 0px;
        top: -5px;
        overflow: hidden;
        cursor: pointer;

        .ivu-icon-ios-close {
            color: #999;
            transition: color .2s ease;
        }
    }

    .window-close .ivu-icon-ios-close:hover {
        color: #444;
    }
}
</style>
