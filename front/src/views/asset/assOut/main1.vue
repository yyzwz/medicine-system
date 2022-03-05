<template>
<!-- 唯一div -->
<div class="search">
    <!-- 新增页面 -->
    <add v-if="currView == 'add'" @close="currView = 'index'" @submited="submited" />
    <!-- 编辑页面 -->
    <edit v-if="currView == 'edit'" @close="currView = 'index'" @submited="submited" :data="formData" />
    <!-- 卡片盒子 -->
    <Card v-show="currView == 'index'">
        <!-- 上方按钮与搜索层 -->
        <Row v-show="openSearch" @keydown.enter.native="handleSearch">
            <!-- Form父级盒子 -->
            <Form ref="searchForm" :model="searchForm" inline :label-width="70">
                <!-- 资产名称子级盒子 -->
                <Form-item label="资产名称" prop="assetName">
                    <Input type="text" v-model="searchForm.assetName" placeholder="请输入资产名称" clearable style="width: 200px" />
                </Form-item>
                <!-- 领用人子级盒子 -->
                <Form-item label="领用人" prop="recipients">
                    <Input type="text" v-model="searchForm.recipients" placeholder="请输入领用人" clearable style="width: 200px" />
                </Form-item>
                <!-- 按钮层 -->
                <Form-item style="margin-left:-35px;" class="br">
                    <!-- 搜索按钮 -->
                    <Button @click="handleSearch" size="small" ghost type="success" icon="ios-search">搜索</Button>
                    <!-- 重置按钮 -->
                    <Button @click="handleReset" size="small" ghost type="warning" icon="md-refresh">重置</Button>
                    <!-- 新增按钮 -->
                    <Button @click="add" size="small" ghost type="primary" icon="md-add" :disabled="!$route.meta.permTypes.includes('add')">添加</Button>
                    <!-- 删除按钮 -->
                    <Button @click="delAll" size="small" ghost type="error" icon="md-trash" :disabled="!$route.meta.permTypes.includes('edit')">删除</Button>
                    <!-- 刷新按钮 -->
                    <Button @click="getDataList" size="small" ghost type="success" icon="md-refresh">刷新</Button>
                    <!-- 提示开关 -->
                    <Button type="dashed" size="small" @click="openTip = !openTip">{{
              openTip ? "关闭提示" : "开启提示"
            }}</Button>
                </Form-item>
            </Form>
        </Row>
        <!-- 提示 -->
        <Row v-show="openTip">
            <Alert show-icon>
                已选择
                <!-- 当前选择 -->
                <span class="select-count">{{ selectCount }}</span> 项
                <!-- 清空 -->
                <a class="select-clear" @click="clearSelectAll">清空</a>
            </Alert>
        </Row>
        <!-- 表格层盒子 -->
        <Row>
            <!-- 根据后台数据生成的表格 -->
            <Table :loading="loading" border :columns="columns" :data="data" ref="table" sortable="custom" @on-sort-change="changeSort" @on-selection-change="changeSelect"></Table>
        </Row>
        <!-- 分页栏 -->
        <Row type="flex" justify="end" class="page">
            <!-- 分页器,可控制每页显示的条数 -->
            <Page :current="searchForm.pageNumber" :total="total" :page-size="searchForm.pageSize" @on-change="changePage" @on-page-size-change="changePageSize" :page-size-opts="[10, 20, 50]" size="small" show-total show-elevator show-sizer></Page>
        </Row>
    </Card>
</div>
</template>

<script>
import {
    getWarehouseOutList,
    deleteWarehouseOut
} from "./api1.js";
// 根据你的实际添加编辑组件位置路径修改
import add from "./add1.vue";
import edit from "./edit1.vue";
export default {
    name: "single-window",
    components: {
        add,
        edit,
    },
    data() {
        return {
            openSearch: true, // 显示搜索
            openTip: true, // 显示提示
            formData: {},
            currView: "index",
            loading: true, // 表单加载状态
            searchForm: {
                // 搜索框初始化对象
                pageNumber: 1, // 当前页数
                pageSize: 10, // 页面大小
                sort: "createTime", // 默认排序字段
                order: "desc", // 默认排序方式
                nature: "固定资产",
            },
            selectList: [], // 多选数据
            selectCount: 0, // 多选计数
            columns: [
                // 表头
                {
                    type: "selection",
                    width: 60,
                    align: "center",
                },
                {
                    type: "index",
                    width: 60,
                    align: "center",
                },
                {
                    title: "资产名称",
                    key: "assetName",
                    minWidth: 120,
                    sortable: false,
                },
                {
                    title: "领用人",
                    key: "recipients",
                    minWidth: 120,
                    sortable: false,
                },
                {
                    title: "型号",
                    key: "model",
                    minWidth: 120,
                    sortable: false,
                },
                {
                    title: "单价",
                    key: "unitPrice",
                    minWidth: 120,
                    sortable: true,
                },
                {
                    title: "数量",
                    key: "number",
                    minWidth: 120,
                    sortable: true,
                },
                {
                    title: "操作",
                    key: "action",
                    align: "center",
                    width: 200,
                    render: (h, params) => {
                        var that = this;
                        return h("div", [
                            h(
                                "Button", {
                                    props: {
                                        type: "primary",
                                        size: "small",
                                        ghost: true,
                                        icon: "ios-create-outline",
                                        disabled: !(
                                            that.$route.meta.permTypes &&
                                            that.$route.meta.permTypes.includes("edit")
                                        ),
                                    },
                                    style: {
                                        marginRight: "5px",
                                    },
                                    on: {
                                        click: () => {
                                            this.edit(params.row);
                                        },
                                    },
                                },
                                "编辑"
                            ),
                            h(
                                "Button", {
                                    props: {
                                        type: "error",
                                        size: "small",
                                        ghost: true,
                                        icon: "md-trash",
                                        disabled: !(
                                            that.$route.meta.permTypes &&
                                            that.$route.meta.permTypes.includes("edit")
                                        ),
                                    },
                                    on: {
                                        click: () => {
                                            this.remove(params.row);
                                        },
                                    },
                                },
                                "删除"
                            ),
                        ]);
                    },
                },
            ],
            data: [], // 表单数据
            pageNumber: 1, // 当前页数
            pageSize: 10, // 页面大小
            total: 0, // 表单数据总数
        };
    },
    methods: {
        // 加载调用
        init() {
            this.getDataList();
        },
        // 提交
        submited() {
            this.currView = "index";
            this.getDataList();
        },
        // 当前页数
        changePage(v) {
            this.searchForm.pageNumber = v;
            this.getDataList();
            this.clearSelectAll();
        },
        // 页面大小
        changePageSize(v) {
            this.searchForm.pageSize = v;
            this.getDataList();
        },
        // 搜索
        handleSearch() {
            this.searchForm.pageNumber = 1;
            this.searchForm.pageSize = 10;
            this.getDataList();
        },
        // 重置搜索条件
        handleReset() {
            this.$refs.searchForm.resetFields();
            this.searchForm.pageNumber = 1;
            this.searchForm.pageSize = 10;
            // 重新加载数据
            this.getDataList();
        },
        // 切换查询排序规则
        changeSort(e) {
            this.searchForm.sort = e.key;
            this.searchForm.order = e.order;
            if (e.order === "normal") {
                this.searchForm.order = "";
            }
            this.getDataList();
        },
        // 全选
        clearSelectAll() {
            this.$refs.table.selectAll(false);
        },
        // 多选
        changeSelect(e) {
            this.selectList = e;
            this.selectCount = e.length;
        },
        // 获取渲染
        getDataList() {
            this.loading = true;
            getWarehouseOutList(this.searchForm).then((res) => {
                this.loading = false;
                if (res.success) {
                    this.data = res.result.records;
                    this.total = res.result.total;
                }
            });
        },
        // 新增
        add() {
            this.currView = "add";
        },
        // 编辑
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
        // 删除
        remove(v) {
            this.$Modal.confirm({
                title: "确认删除",
                // 记得确认修改此处
                content: "您确认要删除 " + v.name + " ?",
                loading: true,
                onOk: () => {
                    // 删除
                    deleteWarehouseOut({
                        ids: v.id
                    }).then((res) => {
                        this.$Modal.remove();
                        if (res.success) {
                            this.$Message.success("操作成功");
                            this.getDataList();
                        }
                    });
                },
            });
        },
        // 批量删除
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
                    deleteWarehouseOut({
                        ids: ids
                    }).then((res) => {
                        this.$Modal.remove();
                        if (res.success) {
                            this.$Message.success("操作成功");
                            this.clearSelectAll();
                            this.getDataList();
                        }
                    });
                },
            });
        },
    },
    mounted() {
        this.init();
    },
};
</script>

<style lang="less">
// 建议引入通用样式 具体路径自行修改 可删除下面样式代码
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
</style>
