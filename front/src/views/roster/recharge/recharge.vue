<template>
<div class="search">
    <add v-if="currView=='add'" @close="currView='index'" @submited="submited" />
    <edit v-if="currView=='edit'" @close="currView='index'" @submited="submited" :data="formData" />
    <Card v-show="currView=='index'">
        <Row v-show="openSearch" @keydown.enter.native="handleSearch">
            <Form ref="searchForm" :model="searchForm" inline :label-width="70">
                <Form-item label="姓名" prop="name">
                    <Input type="text" v-model="searchForm.name" placeholder="请输入参保人员姓名" clearable style="width: 200px" />
                </Form-item>
                <Form-item style="margin-left:-35px;" class="br">
                    <Button @click="handleSearch" type="primary" shape="circle" icon="ios-search">搜索</Button>
                    <Button @click="handleReset" type="warning" shape="circle">重置</Button>
                </Form-item>
            </Form>
        </Row>
        <Row>
            <Table :loading="loading" border :columns="columns" :data="data" ref="table" sortable="custom" @on-sort-change="changeSort" @on-selection-change="changeSelect"></Table>
        </Row>
        <Row type="flex" justify="end" class="page">
            <Page :current="searchForm.pageNumber" :total="total" :page-size="searchForm.pageSize" @on-change="changePage" @on-page-size-change="changePageSize" :page-size-opts="[10,20,50]" size="small" show-total show-elevator show-sizer></Page>
        </Row>
    </Card>
    <Modal v-model="isShowAddMessageFlag" title="医保充值" @on-ok="sendMessage" @on-cancel="closeSendMessage">
        <span>请输入充值金额:</span>
        <InputNumber v-model="sendMessageContext" :max="50000" :min="1" :step="0.1" />
    </Modal>
</div>
</template>

<script>
import {
    getRosterList,
    chongZhi
} from "@/api/index";
import {
    deleteMeeting
} from "./api.js";
import add from "./add.vue";
import edit from "./edit.vue";
export default {
    name: "single-window",
    components: {
        add,
        edit
    },
    data() {
        return {
            sendMessageCid: '',
            sendMessageContext: '0.0',
            isShowAddMessageFlag: false,
            openSearch: true, // 显示搜索
            openTip: true, // 显示提示
            formData: {},
            currView: "index",
            loading: true, // 表单加载状态
            searchForm: { // 搜索框初始化对象
                pageNumber: 1, // 当前页数
                pageSize: 10, // 页面大小
                sort: "createTime", // 默认排序字段
                order: "desc", // 默认排序方式
            },
            selectList: [], // 多选数据
            selectCount: 0, // 多选计数
            columns: [{
                    type: "index",
                    minWidth: 50,
                    align: "center"
                },
                {
                    title: "姓名",
                    key: "name",
                    minWidth: 60,
                    sortable: false,
                },
                {
                    title: "性别",
                    key: "sex",
                    minWidth: 50,
                    sortable: true,
                },
                {
                    title: "电话号码",
                    key: "mobile",
                    minWidth: 80,
                    sortable: false,
                },
                {
                    title: "身份证号码",
                    key: "identity",
                    minWidth: 120,
                    sortable: false,
                },
                {
                    title: "社保卡号",
                    key: "cardNumber",
                    minWidth: 120,
                    sortable: false,
                },
                {
                    title: "余额",
                    key: "balance",
                    minWidth: 60,
                    sortable: false,
                },
                {
                    title: "操作",
                    key: "action",
                    minWidth: 140,
                    align: "center",
                    fixed: "right",
                    render: (h, params) => {
                        return h("div", [
                            h(
                                "Button", {
                                    props: {
                                        type: "primary",
                                        size: "small"
                                    },
                                    style: {
                                        marginRight: "5px"
                                    },
                                    on: {
                                        click: () => {
                                            this.recharge(params.row);
                                        }
                                    }
                                },
                                "充值"
                            )
                        ]);
                    }
                }
            ],
            data: [], // 表单数据
            pageNumber: 1, // 当前页数
            pageSize: 10, // 页面大小
            total: 0 // 表单数据总数
        };
    },
    methods: {
        init() {
            this.getDataList();
        },
        submited() {
            this.currView = "index";
            this.getDataList();
        },
        changePage(v) {
            this.searchForm.pageNumber = v;
            this.getDataList();
            this.clearSelectAll();
        },
        changePageSize(v) {
            this.searchForm.pageSize = v;
            this.getDataList();
        },
        handleSearch() {
            this.searchForm.pageNumber = 1;
            this.searchForm.pageSize = 10;
            this.getDataList();
        },
        handleReset() {
            this.$refs.searchForm.resetFields();
            this.searchForm.pageNumber = 1;
            this.searchForm.pageSize = 10;
            // 重新加载数据
            this.getDataList();
        },
        changeSort(e) {
            this.searchForm.sort = e.key;
            this.searchForm.order = e.order;
            if (e.order === "normal") {
                this.searchForm.order = "";
            }
            this.getDataList();
        },
        clearSelectAll() {
            this.$refs.table.selectAll(false);
        },
        changeSelect(e) {
            this.selectList = e;
            this.selectCount = e.length;
        },
        getDataList() {
            this.loading = true;
            getRosterList(this.searchForm).then(res => {
                this.loading = false;
                if (res.success) {
                    this.data = res.result.records;
                    this.total = res.result.total;
                }
            });
        },
        recharge(e) {
            this.isShowAddMessageFlag = true;
            this.sendMessageCid = e.id;
        },
        sendMessage() {
            var that = this;
            chongZhi({
                cid: that.sendMessageCid,
                message: that.sendMessageContext
            }).then(res => {
                // console.log(res);
                if (res.success) {
                    this.$Message.success("充值成功了");
                    this.isShowAddMessageFlag = false;
                    that.sendMessageContext = "0.0";
                    that.getDataList();
                }
            })
        },
        closeSendMessage() {
            this.isShowAddMessageFlag = false;
        },
        add() {
            this.currView = "add";
        },
        edit(v) {
            // 转换null为""
            for (let attr in v) {
                if (v[attr] == null) {
                    v[attr] = "";
                }
            }
            let str = JSON.stringify(v);
            let data = JSON.parse(str);
            this.formData = data;
            this.currView = "edit";
        },
        remove(v) {
            this.$Modal.confirm({
                title: "确认删除",
                // 记得确认修改此处
                content: "您确认要删除 " + v.name + " ?",
                loading: true,
                onOk: () => {
                    // 删除
                    deleteMeeting({
                        ids: v.id
                    }).then(res => {
                        this.$Modal.remove();
                        if (res.success) {
                            this.$Message.success("操作成功");
                            this.getDataList();
                        }
                    });
                }
            });
        },
        delAll() {
            if (this.selectCount <= 0) {
                this.$Message.warning("您还未选择要删除的数据");
                return;
            }
            this.$Modal.confirm({
                title: "确认删除",
                content: "您确认要删除所选的 " + this.selectCount + " 条数据?",
                loading: true,
                onOk: () => {
                    let ids = "";
                    this.selectList.forEach(function (e) {
                        ids += e.id + ",";
                    });
                    ids = ids.substring(0, ids.length - 1);
                    // 批量删除
                    deleteMeeting({
                        ids: ids
                    }).then(res => {
                        this.$Modal.remove();
                        if (res.success) {
                            this.$Message.success("操作成功");
                            this.clearSelectAll();
                            this.getDataList();
                        }
                    });
                }
            });
        }
    },
    mounted() {
        this.init();
    }
};
</script>

<style lang="less">
.search {
    .operation {
        margin-bottom: 2vh;
    }

    .select-count {
        font-weight: 600;
        color: #40a9ff;
    }

    .select-clear {
        margin-left: 10px;
    }

    .page {
        margin-top: 2vh;
    }

    .drop-down {
        margin-left: 5px;
    }
}
</style>
