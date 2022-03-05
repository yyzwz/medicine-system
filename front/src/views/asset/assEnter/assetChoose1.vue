<template>
<div class="user-choose">
    <Button @click="assetModalVisible=true" :icon="icon">{{text}}</Button>

    <Drawer title="选择固定资产" closable v-model="assetModalVisible" width="800" draggable>
        <Form ref="searchUserForm" :model="searchUserForm" inline :label-width="55">
            <Form-item label="资产名称" prop="houseNumber">
                <Input type="text" v-model="searchUserForm.houseNumber" clearable placeholder="请输入资产名称" style="width: 200px" />
            </Form-item>
            <Form-item style="margin-left:-35px;" class="br">
                <Button @click="handleSearchUser" type="primary" icon="ios-search">搜索</Button>
                <Button @click="handleResetUser">重置</Button>
            </Form-item>
        </Form>
        <Table :loading="userLoading" border :columns="userColumns" :data="userData" @on-row-click="changeSelect" style="margin: 2vh 0;"></Table>
        <Row type="flex" justify="end">
            <Page :current="searchUserForm.pageNumber" :total="totalUser" :page-size="searchUserForm.pageSize" @on-change="changeUserPage" @on-page-size-change="changeUserPageSize" :page-size-opts="[10,20,50]" size="small" show-total show-elevator show-sizer transfer></Page>
        </Row>
    </Drawer>
</div>
</template>

<script>
import {
    getAssetListData1
} from "./api1.js";
export default {
    name: "userChoose",
    components: {},
    props: {
        text: {
            type: String,
            default: "选择资产"
        },
        icon: {
            type: String,
            default: "md-person-add"
        }
    },
    data() {
        return {
            userLoading: true,
            assetModalVisible: false,
            selectUsers: [],
            searchUserForm: {
                pageNumber: 1, // 当前页数
                pageSize: 10, // 页面大小
                sort: "createTime", // 默认排序字段
                order: "desc" // 默认排序方式
            },
            userColumns: [{
                    title: "资产名称",
                    key: "assetName",
                    minWidth: 130
                },
                {
                    title: "型号",
                    key: "model",
                    minWidth: 130
                },
                {
                    title: "数量",
                    key: "number",
                    minWidth: 120,
                    sortable: true
                },
                {
                    title: "现有数量",
                    key: "existingNumber",
                    minWidth: 120,
                    sortable: true
                },
                {
                    title: "单价",
                    key: "unitPrice",
                    minWidth: 120,
                    sortable: true
                },
                {
                    title: "备注",
                    key: "remarks",
                    minWidth: 120,
                    sortable: true
                }
            ],
            userData: [],
            totalUser: 0
        };
    },
    methods: {
        changeSelect(e) {
            this.$emit("on-change", e);
            this.assetModalVisible = false;
        },
        changeUserPage(v) {
            this.searchUserForm.pageNumber = v;
            this.getAssetDataList();
        },
        changeUserPageSize(v) {
            this.searchUserForm.pageSize = v;
            this.getAssetDataList();
        },
        getAssetDataList() {
            this.userLoading = true;
            getAssetListData1(this.searchUserForm).then(res => {
                this.userLoading = false;
                if (res.success) {
                    this.userData = res.result.records;
                    this.totalUser = res.result.total;
                }
            });
        },
        handleSearchUser() {
            this.searchUserForm.pageNumber = 1;
            this.searchUserForm.pageSize = 10;
            this.getAssetDataList();
        },
        handleResetUser() {
            this.$refs.searchUserForm.resetFields();
            this.searchUserForm.pageNumber = 1;
            this.searchUserForm.pageSize = 10;
            this.$refs.dep.clearSelect();
            this.searchUserForm.departmentId = "";
            // 重新加载数据
            this.getAssetDataList();
        },
        clearSelectData() {
            this.selectUsers = [];
            this.$emit("on-change", this.selectUsers);
        },
        handleCancelUser(e, id) {
            // 删除所选用户
            this.selectUsers = this.selectUsers.filter(e => {
                return e.id != id;
            });
            this.$emit("on-change", this.selectUsers);
            this.$Message.success("删除所选用户成功");
        }
    },
    mounted() {
        this.getAssetDataList();
    }
};
</script>

<style lang="less">
.user-choose {
    .clear {
        font-size: 12px;
        margin-left: 15px;
        color: #40a9ff;
        cursor: pointer;
    }

    .collapse {
        font-size: 12px;
        margin-top: 15px;
        width: 500px;
    }

    .select-count {
        font-weight: 600;
        color: #40a9ff;
    }
}
</style>
