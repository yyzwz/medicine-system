<template>
<div class="search">
    <Card>
        <Row v-show="openSearch" @keydown.enter.native="handleSearch">
            <Form ref="searchForm" :model="searchForm" inline :label-width="70">
                <Form-item label="参保人员" prop="userName">
                    <Input type="text" v-model="searchForm.userName" placeholder="请输入参保人员姓名" clearable style="width: 200px" />
                </Form-item>
                <Form-item label="状态" prop="status">
                    <Input type="text" v-model="searchForm.status" placeholder="请选择状态" clearable style="width: 200px" />
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
    <Modal v-model="isShowTuiFlag" title="审核退回确认" @on-ok="notPass">
        <Form label-colon>
            <FormItem label="请输入退回的原因">
                <input v-model="tuiMessage" />
            </FormItem>
        </Form>
    </Modal>
</div>
</template>

<script>
import {
    getMeetingList,
    deleteMeeting,
    pass,
    notPass
} from "./api.js";
export default {
    name: "single-window",
    components: {
    },
    data() {
        return {
            tuiMessage: '',
            isShowTuiFlag: false,
            openSearch: true, // 显示搜索
            openTip: true, // 显示提示
            formData: {},
            loading: true, // 表单加载状态
            searchForm: { // 搜索框初始化对象
                pageNumber: 1, // 当前页数
                pageSize: 10, // 页面大小
                sort: "createTime", // 默认排序字段
                order: "desc", // 默认排序方式
            },
            selectList: [], // 多选数据
            selectCount: 0, // 多选计数
            columns: [
                // 表头
                {
                    type: "selection",
                    width: 60,
                    align: "center"
                },
                {
                    type: "index",
                    width: 60,
                    align: "center"
                },
                {
                    title: "参保人姓名",
                    key: "userName",
                    minWidth: 120,
                    sortable: false,
                    align: "center"
                },
                {
                    title: "审核状态",
                    key: "status",
                    minWidth: 120,
                    sortable: true,
                    align: "center",
                    render: (h, params) => {
                        if (params.row.status == '待审核') {
                            return h('div', [
                                h('span', {
                                    style: {
                                        color: '#0000ff'
                                    }
                                }, params.row.status),
                            ]);
                        } else if (params.row.status == '审核通过') {
                            return h('div', [
                                h('span', {
                                    style: {
                                        color: '#64c92c'
                                    }
                                }, params.row.status),
                            ]);
                        } else {
                            return h('div', [
                                h('span', {
                                    style: {
                                        color: '#ff0000'
                                    }
                                }, params.row.status),
                            ]);
                        }
                    }
                },
                {
                    title: "审核意见",
                    key: "message",
                    minWidth: 120,
                    sortable: false,
                    align: "center"
                },
                {
                    title: "保险名",
                    key: "insuranceName",
                    minWidth: 120,
                    sortable: false,
                    align: "center"
                },
                {
                    title: "抵扣金额",
                    key: "money",
                    minWidth: 120,
                    sortable: false,
                    align: "center"
                },
                {
                    title: "操作",
                    key: "action",
                    minWidth: 150,
                    align: "center",
                    fixed: "right",
                    render: (h, params) => {
                        if (params.row.status == '待审核') {
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
                                                this.pass(params.row);
                                            }
                                        }
                                    },
                                    "审核通过"
                                ),
                                h(
                                    "Button", {
                                        props: {
                                            type: "error",
                                            size: "small"
                                        },
                                        on: {
                                            click: () => {
                                                this.notPassFx(params.row);
                                            }
                                        }
                                    },
                                    "退回"
                                )
                            ]);
                        } else {

                        }

                    }
                }
            ],
            data: [], // 表单数据
            pageNumber: 1, // 当前页数
            pageSize: 10, // 页面大小
            total: 0, // 表单数据总数
            eid: '',
        };
    },
    methods: {
        init() {
            this.getDataList();
        },
        pass(e) {
            // console.log(e);
            this.$Modal.confirm({
                title: "审核通过?",
                content: "确认审核通过?",
                loading: true,
                onOk: () => {
                    pass({
                        id: e.id
                    }).then(res => {
                        this.$Modal.remove();
                        if (res.success) {
                            this.$Message.success("审核通过成功");
                            this.clearSelectAll();
                            this.getDataList();
                        }
                    });
                }
            });
        },
        notPassFx(e) {
            this.eid = e.id;
            this.isShowTuiFlag = true;
        },
        notPass(e) {
            // console.log(e);
            notPass({
                id: this.eid,
                msg: this.tuiMessage
            }).then(res => {
                this.$Modal.remove();
                if (res.success) {
                    this.$Message.success("审核退回成功");
                    this.clearSelectAll();
                    this.getDataList();
                }
            });
        },
        submited() {
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
            getMeetingList(this.searchForm).then(res => {
                console.log(res);
                this.loading = false;
                if (res.success) {
                    this.data = res.result.records;
                    this.total = res.result.total;
                }
            });
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
