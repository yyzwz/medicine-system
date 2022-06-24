<template>
<div class="search">
    <add v-if="currView=='add'" @close="currView='index'" @submited="submited" />
    <edit v-if="currView=='edit'" @close="currView='index'" @submited="submited" :data="formData" />
    <Card v-show="currView=='index'">
        <Row v-show="openSearch" @keydown.enter.native="handleSearch">
            <Form ref="searchForm" :model="searchForm" inline :label-width="0">
                <Form-item ref="searchForm" :model="searchForm" inline :label-width="0" style="display:flex;">
                    <Form-item label="" prop="name">
                        <Input type="text" v-model="searchForm.name" placeholder="请输入姓名" clearable style="width: 200px" />
                    </Form-item>
                    <Form-item label="" prop="idCard">
                        <Input type="text" v-model="searchForm.idCard" placeholder="请输入身份证" clearable style="width: 200px" />
                    </Form-item>
                    <Form-item style="margin-left:10px;" class="br">
                        <Button @click="handleSearch" type="primary" icon="ios-search" size="small" ghost>搜索</Button>
                        <Button @click="handleReset" type="warning" size="small" icon="md-refresh" ghost>重置</Button>
                        <Button @click="add" type="info" size="small" icon="md-add" ghost>添加</Button>
                        <Button @click="delAll" type="error" icon="md-trash" size="small" ghost>删除</Button>
                        <Button @click="excelData" type="success" icon="md-paper-plane" size="small" ghost>导出</Button>
                    </Form-item>
                    <Form-item style="position:fixed;right:50px;top:130px">
                        <Button type="info" @click="showFilterPanelFlag = !showFilterPanelFlag" class="showFilterPanelFlag" icon="md-settings" size="small" ghost>
                            列筛选</Button>
                        <Button type="warning" @click="modal1 = true" class="showFilterPanelFlag" icon="ios-help-circle-outline" size="small" ghost>
                            使用教程</Button>
                        <Modal v-model="modal1" title="使用教程">
                            <p>1.XXXXXXXXXXXXXXXXXXXXXXXX</p>
                            <p>2.XXXXXXXXXXXXXXXXXXXXXXXX</p>
                            <p>3.XXXXXXXXXXXXXXXXXXXXXXXX</p>
                        </Modal>
                    </Form-item>
                </Form-item>
            </Form>
        </Row>
        <Row class="operation" style="position:relative;">
            <transition>
                <div v-show="showFilterPanelFlag" class="filter-panel">
                    <CheckboxGroup v-model="selected">
                        <div v-for="item in mycolumns" :key="item.key">
                            <Checkbox :label="item.title" style="margin: 2px 5px"></Checkbox>
                        </div>
                    </CheckboxGroup>
                </div>
            </transition>
        </Row>
        <Row v-show="openTip"> </Row>
        <Row>
            <Table :loading="loading" :height="tableHeight" border stripe size="small" :columns="columns" :data="data" ref="table" sortable="custom" @on-sort-change="changeSort" @on-selection-change="changeSelect" @on-row-click="rowClick" :row-class-name="rowClassNmae"></Table>
        </Row>
        <Row type="flex" justify="end" class="page">
            <Page :current="searchForm.pageNumber" :total="total" :page-size="searchForm.pageSize" @on-change="changePage" @on-page-size-change="changePageSize" :page-size-opts="[15,20,50]" size="small" show-total show-elevator show-sizer></Page>
        </Row>
    </Card>
    <Collapse accordion :value="xiala" v-show="currView=='index'">
        <Panel name="a" class=" ivu-alert-info ivu-alert-with-icon">
            <span style="color:#ff0000">当前选择人员：{{selectRow.name}}</span>
            <div slot="content">
                <Col>
                <card>
                    <div>
                        <Form ref="form" :model="form" :rules="formValidate" label-position="top">
                            <Tabs :value="chooseName" @on-click="changeTab">
                                <TabPane label="基础信息" name="name1">
                                    <Row :gutter="32">
                                        <Divider>
                                            <Button v-if="!isEdit" type="error" :loading="submitLoading" @click="submitFx">保存信息</Button>
                                            <Button v-if="isEdit" type="error" :loading="submitLoading" @click="isEdit=false">开始编辑</Button>
                                        </Divider>
                                    </Row>
                                    <Row :gutter="32">
                                        <Col span="20">
                                        <Row :gutter="32">
                                            <Col span="12">
                                            <FormItem label="姓名" prop="name">
                                                <Input v-model="selectRow.name" :readonly="isEdit" />
                                            </FormItem>
                                            </Col>
                                            <Col span="12">
                                            <FormItem label="性别" prop="sex">
                                                <Select v-model="selectRow.sex" :disabled="isEdit">
                                                    <Option value="男">男</Option>
                                                    <Option value="女">女</Option>
                                                </Select>
                                            </FormItem>
                                            </Col>
                                        </Row>
                                        <Row :gutter="32">
                                            <Col span="12">
                                            <FormItem label="出生地" prop="birthplace">
                                                <Input v-model="selectRow.birthplace" :readonly="isEdit" />
                                            </FormItem>
                                            </Col>
                                            <Col span="12">
                                            <FormItem label="年龄" prop="age">
                                                <InputNumber :max="120" :min="0" v-model="selectRow.age" :readonly="isEdit"></InputNumber>
                                            </FormItem>
                                            </Col>
                                        </Row>
                                        </Col>
                                        <Col span="4">
                                        <img :src="onePhotoSrc" style="width:100px;height:150px;border:1px solid #000;" />
                                        </Col>
                                    </Row>
                                    <Row :gutter="32">
                                        <Col span="8">
                                        <FormItem label="电话号码" prop="mobile">
                                            <Input v-model="selectRow.mobile" :readonly="isEdit" />
                                        </FormItem>
                                        </Col>
                                        <Col span="8">
                                        <FormItem label="身份证" prop="idCard">
                                            <Input v-model="selectRow.idCard" :readonly="isEdit" />
                                        </FormItem>
                                        </Col>
                                        <Col span="8">
                                        <FormItem label="家庭地址" prop="address">
                                            <Input v-model="selectRow.address" :readonly="isEdit" />
                                        </FormItem>
                                        </Col>
                                    </Row>
                                </TabPane>
                                <TabPane label="社保情况" name="name2">
                                    <Row :gutter="32">
                                        <Divider>
                                            <Button v-if="!isEdit" type="error" :loading="submitLoading" @click="submitFx">保存信息</Button>
                                            <Button v-if="isEdit" type="error" :loading="submitLoading" @click="isEdit=false">开始编辑</Button>
                                        </Divider>
                                    </Row>
                                    <Row :gutter="32">
                                        <Col span="12">
                                        <FormItem label="社保卡号" prop="cardNumber">
                                            <Input v-model="selectRow.cardNumber" :readonly="isEdit" />
                                        </FormItem>
                                        </Col>
                                        <Col span="12">
                                        <FormItem label="余额" prop="money">
                                            <InputNumber :max="100000" :min="0" v-model="selectRow.money" :readonly="isEdit"></InputNumber>
                                        </FormItem>
                                        </Col>
                                        <Col span="12">
                                        <FormItem label="保险类型" prop="insuranceType">
                                            <Select v-model="selectRow.insuranceType" :disabled="isEdit">
                                                <Option v-for="(item,index) in insuranceList" :value="item.id" :key="index">{{ item.title }}</Option>
                                            </Select>
                                        </FormItem>
                                        </Col>
                                    </Row>
                                </TabPane>
                                <TabPane label="参保情况" name="name3">
                                    <card>
                                        <div v-if="selectRow.status==-2">
                                            <span style="color:#ff0000;font-size:26px;">当前尚未选择人员</span>
                                        </div>
                                        <div v-else>
                                            <span style="color:#ff0000;font-size:26px;"> 当前选择人员： {{selectRow.name}}</span>
                                        </div>
                                    </card>
                                    <card>
                                        <div v-if="selectRow.status==-2">
                                            当前人员状态：未选择用户
                                        </div>
                                        <div v-else-if="selectRow.status==0">
                                            <span style="color:#00BFFF;font-size:26px;">当前人员状态：正常参保</span>
                                        </div>
                                        <div v-else>
                                            <span style="color:#ff0000;font-size:26px;"> 当前人员状态： 已停保</span>
                                        </div>
                                    </card>

                                    <card>
                                        <div v-if="selectRow.status==-2">
                                            <span style="color:#ff0000;font-size:26px;">退保操作：</span>未选择用户
                                        </div>
                                        <div v-else-if="selectRow.status==0">
                                            <span style="color:#ff0000;font-size:26px;">退保操作：</span><Button @click="disableOneFx" type="error" :size="large">退保</Button>
                                        </div>
                                        <div v-else>
                                            <span style="color:#ff0000;font-size:26px;">退保操作：</span><Button @click="enableOneFx" type="warning" :size="large">参保</Button>
                                        </div>
                                    </card>
                                    <card>
                                        <div v-if="selectRow.status==-2">
                                            <span style="color:#ff0000;font-size:26px;">当前尚未选择人员</span>
                                        </div>
                                        <div v-else>
                                            <span style="color:#ff0000;font-size:26px;"> 永久删除：</span>
                                            <Button @click="remove(selectRow)" type="error" :size="large">永久删除</Button>
                                        </div>
                                    </card>
                                </TabPane>
                            </Tabs>
                        </Form>
                    </div>
                </card>
                </Col>
            </div>
        </Panel>
    </Collapse>
</div>
</template>

<script>
import {
    getRosterList,
    deleteRoster,
    getInsuranceList,
    editRoster,
    disableOne,
    enableOne
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
            // 新增变量
            onePhotoSrc: 'https://artskyhome.com:17476/static/gitee/medicineSystem/home3.jpg',
            xiala: 'b',
            chooseName: 'name1',
            insuranceList: [],
            submitLoading: false,
            isEdit: true,
            // 原有变量
            tableHeight: 0,
            selected: [
                "选择",
                "序号",
                "姓名",
                "性别",
                "出生地",
                "年龄",
                "电话号码",
                "身份证",
                "家庭地址",
                "保险名称",
                "状态",
                "社保卡状态",
                "社保卡号",
                "余额",
                "创建时间",
                "创建者",
                "修改时间",
                "修改者",
                "操作",
            ],
            modal1: false,
            openSearch: true, // 显示搜索
            openTip: true, // 显示提示
            formData: {},
            currView: "index",
            loading: true, // 表单加载状态
            searchForm: { // 搜索框初始化对象
                pageNumber: 1, // 当前页数
                pageSize: 15, // 页面大小
                sort: "createTime", // 默认排序字段
                order: "desc", // 默认排序方式
            },
            selectList: [], // 多选数据
            selectCount: 0, // 多选计数
            selectRow: 0,
            columns: [
                {
                    type: "selection",
                    width: 60,
                    title: "选择",
                    align: "center",
                    fixed: "left",
                },
                {
                    title: "序号",
                    width: 85,
                    align: "center",
                    fixed: "left",
                    sortType: true,
                    render: (h, params) => {
                        return h(
                            "span",
                            params.index +
                            (this.searchForm.pageNumber - 1) * this.searchForm.pageSize +
                            1
                        );
                    },
                },
                {
                    title: "姓名",
                    key: "name",
                    minWidth: 120,
                    tooltip: true,
                    sortable: false,
                },
                {
                    title: "性别",
                    key: "sex",
                    minWidth: 120,
                    tooltip: true,
                    sortable: false,
                },
                {
                    title: "出生地",
                    key: "birthplace",
                    minWidth: 120,
                    tooltip: true,
                    sortable: false,
                },
                {
                    title: "年龄",
                    key: "age",
                    minWidth: 100,
                    tooltip: true,
                    sortable: false,
                },
                {
                    title: "电话号码",
                    key: "mobile",
                    minWidth: 120,
                    tooltip: true,
                    sortable: false,
                },
                {
                    title: "身份证",
                    key: "idCard",
                    minWidth: 160,
                    tooltip: true,
                    sortable: false,
                },
                {
                    title: "家庭地址",
                    key: "address",
                    minWidth: 180,
                    tooltip: true,
                    sortable: false,
                },
                {
                    title: "保险名称",
                    key: "insuranceName",
                    minWidth: 120,
                    tooltip: true,
                    sortable: false,
                },
                {
                    title: "状态",
                    key: "status",
                    minWidth: 120,
                    tooltip: true,
                    sortable: false,
                    render: (h, params) => {
                        return h("div", [
                            h(
                                "Tag", {
                                    props: {
                                        color: (params.row.status > 0 ? "red" : "blue"),
                                    },
                                },
                                (params.row.status > 0 ? "封存" : "正常")
                            ),
                        ]);
                    }
                },
                {
                    title: "社保卡状态",
                    key: "cardStatus",
                    minWidth: 120,
                    tooltip: true,
                    sortable: false,
                    render: (h, params) => {
                        return h("div", [
                            h(
                                "Tag", {
                                    props: {
                                        color: (params.row.status > 0 ? "red" : "blue"),
                                    },
                                },
                                (params.row.status > 0 ? "封存" : "正常")
                            ),
                        ]);
                    }
                },
                {
                    title: "社保卡号",
                    key: "cardNumber",
                    minWidth: 150,
                    tooltip: true,
                    sortable: false,
                },
                {
                    title: "余额",
                    key: "money",
                    minWidth: 120,
                    tooltip: true,
                    sortable: false,
                },
                {
                    title: "创建时间",
                    key: "createTime",
                    sortable: true,
                    sortType: "desc",
                    minWidth: 180,
                    align: "center",
                    tooltip: true,
                },
                {
                    title: "创建者",
                    key: "createBy",
                    sortable: true,
                    sortType: "desc",
                    minWidth: 100,
                    align: "center",
                    tooltip: true,
                },
                {
                    title: "修改时间",
                    key: "updateTime",
                    minWidth: 180,
                    align: "center",
                    tooltip: true,
                },
                {
                    title: "修改者",
                    key: "updateBy",
                    minWidth: 100,
                    align: "center",
                    tooltip: true,
                },
                {
                    title: "操作",
                    key: "action",
                    align: "center",
                    width: 200,
                    fixed: "right",
                    render: (h, params) => {
                        return h("div", [
                            h(
                                "Button", {
                                    props: {
                                        type: "primary",
                                        size: "small",
                                        icon: "ios-create-outline",
                                        ghost: true
                                    },
                                    style: {
                                        marginRight: "5px"
                                    },
                                    on: {
                                        click: () => {
                                            this.edit(params.row);
                                        }
                                    }
                                },
                                "编辑"
                            ),
                            h(
                                "Button", {
                                    props: {
                                        type: "error",
                                        size: "small",
                                        icon: "md-trash",
                                        ghost: true
                                    },
                                    on: {
                                        click: () => {
                                            this.remove(params.row);
                                        }
                                    }
                                },
                                "删除"
                            )
                        ]);
                    }
                }
            ],
            data: [], // 表单数据
            pageNumber: 1, // 当前页数
            pageSize: 10, // 页面大小
            total: 0, // 表单数据总数
            showFilterPanelFlag: false,
        };
    },
    methods: {
        init() {
            this.getDataList();
            this.getInsuranceList();
        },
        disableOneFx() {
            var that = this;
            disableOne({
                id: that.selectRow.id
            }).then(res => {
                if (res.success) {
                    that.getDataList();
                    that.xiala = "b";
                    that.selectRow = {};
                    this.$Message.success("操作成功");
                }
            })
        },
        enableOneFx() {
            var that = this;
            enableOne({
                id: that.selectRow.id
            }).then(res => {
                if (res.success) {
                    that.getDataList();
                    that.xiala = "b";
                    that.selectRow = {};
                    this.$Message.success("操作成功");
                }
            })
        },
        submitFx() {
            var that = this;
            delete this.selectRow.updateTime;
            editRoster(this.selectRow).then(res => {
                if (res.success) {
                    that.getDataList();
                    this.$Message.success("操作成功");
                }
            })
        },
        getInsuranceList() {
            var that = this;
            getInsuranceList().then(res => {
                if (res.success) {
                    that.insuranceList = res.result;
                }
            })
        },
        changeTab(value) {
            this.chooseName = value;
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
        rowClick(row, index) {
            this.xiala = 'a';
            this.selectRow = row;
        },
        rowClassNmae(row, index) {
            if (row.id == this.selectRow.id) {
                return "rowClassNmaeColor";
            }
            return "";
        },
        excelData() {
            this.$refs.table.exportCsv({
                filename: "导出结果",
            });
        },
        handleSearch() {
            this.searchForm.pageNumber = 1;
            this.searchForm.pageSize = 15;
            this.getDataList();
        },
        handleReset() {
            this.$refs.searchForm.resetFields();
            this.searchForm.pageNumber = 1;
            this.searchForm.pageSize = 15;
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
        add() {
            this.currView = "add";
        },
        edit(v) {
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
                content: "您确认要删除 " + v.name + " ?",
                loading: true,
                onOk: () => {
                    // 删除
                    deleteRoster({
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
                    deleteRoster({
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
        this.tableHeight = Number(window.innerHeight - 500);
        this.mycolumns = this.columns;
        let showcolumns = [];
        for (var i = 0; i < this.selected.length; i++) {
            var item = this.selected[i];
            for (var j = 0; j < this.columns.length; j++) {
                if (this.columns[j].title == item) {
                    showcolumns.push(this.columns[j]);
                }
            }
        }
        this.columns = showcolumns;
    },
    watch: {
        selected: function (newcolumns) {
            let showcolumns = [];
            for (var i = 0; i < this.mycolumns.length; i++) {
                var item = this.mycolumns[i];
                if (item.title == undefined) showcolumns.push(item);
                else if (newcolumns.contains(item.title)) showcolumns.push(item);
            }
            this.columns = showcolumns;
        },
    },
};
</script>

<style lang="less">
// @import "../../../styles/table-common.less";
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

.filter-panel {
    width: 166px;
    min-height: 120px;
    height: 200px;
    position: absolute;
    background-color: white;
    z-index: 9999;
    margin-left: 1px;
    overflow-y: scroll;
    border: 1px solid blue;
    top: 35px;
    right: 10px;
}

.openSearch {
    position: absolute;
    right: 240px;
}

.openTip {
    position: absolute;
    right: 130px;
}

.showFilterPanelFlag {
    position: static !important;
    right: 10px;
    margin-right: 10px;
}

.ivu-table td {
    height: 38px !important;
}

.ivu-table-cell-with-expand {
    height: 38px !important;
    line-height: 38px !important;
}

.ivu-table .rowClassNmaeColor td {
    background-color: #b0b3b6 !important;
    color: #ffffff !important;
    font-size: 12px;
}
</style>
