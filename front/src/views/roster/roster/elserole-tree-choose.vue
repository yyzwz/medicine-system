<template>
  <div>
    <div style="display:flex;">
      <Input
        v-model="roleGroupTitle"
        readonly
        style="margin-right:10px;"
        :placeholder="placeholder"
        :clearable="clearable"
        @on-clear="clearSelect"
      />
      <Poptip transfer trigger="click" placement="right" title="选择角色组" width="250">
        <Button icon="md-list">选择角色组</Button>
        <div slot="content">
          <Input
            v-model="searchKey"
            suffix="ios-search"
            @on-change="searchRoleGroup"
            placeholder="输入角色组名搜索"
            clearable
          />
          <div class="roleGroup-tree-bar">
            <Tree
              :data="dataRoleGroup"
              :load-data="loadData"
              @on-select-change="selectTree"
              :multiple="true"
            ></Tree>
            <Spin size="large" fix v-if="roleGroupLoading"></Spin>
          </div>
        </div>
      </Poptip>
    </div>
  </div>
</template>

<script>
import { initElseJueSe, loadElseJueSe, searchElseJueSe } from "@/api/index";
export default {
  name: "roleGroupTreeChoose",
  props: {
    multiple: {
      type: Boolean,
      default: false
    },
    clearable: {
      type: Boolean,
      default: true
    },
    placeholder: {
      type: String,
      default: "点击选择角色组"
    }
  },
  data() {
    return {
      roleGroupLoading: false,
      roleGroupTitle: "",
      searchKey: "",
      dataRoleGroup: [],
      selectRoleGroup: [],
      roleGroupId: []
    };
  },
  methods: {
    initRoleGroupData() {
      initElseJueSe().then(res => {
        if (res.success) {
          res.result.forEach(function(e) {
            if (e.isParent) {
              e.loading = false;
              e.children = [];
            }
            if (e.status == -1) {
              e.title = "[已禁用] " + e.title;
              e.disabled = true;
            }
          });
          this.dataRoleGroup = res.result;
        }
      });
    },
    loadData(item, callback) {
      loadElseJueSe(item.id).then(res => {
        if (res.success) {
          res.result.forEach(function(e) {
            if (e.isParent) {
              e.loading = false;
              e.children = [];
            }
            if (e.status == -1) {
              e.title = "[已禁用] " + e.title;
              e.disabled = true;
            }
          });
          callback(res.result);
        }
      });
    },
    searchRoleGroup() {
      // 搜索角色组
      if (this.searchKey) {
        this.roleGroupLoading = true;
        searchElseJueSe({ title: this.searchKey }).then(res => {
          this.roleGroupLoading = false;
          if (res.success) {
            res.result.forEach(function(e) {
              if (e.status == -1) {
                e.title = "[已禁用] " + e.title;
                e.disabled = true;
              }
            });
            this.dataRoleGroup = res.result;
          }
        });
      } else {
        this.initRoleGroupData();
      }
    },
    selectTree(v) {
      let ids = [],
        title = "";
      v.forEach(e => {
        ids.push(e.id);
        if (title == "") {
          title = e.title;
        } else {
          title = title + "、" + e.title;
        }
      });
      this.roleGroupId = ids;
      this.roleGroupTitle = title;
      //alert(this.roleGroupTitle);
      if (this.multiple) {
        this.$emit("on-change", this.roleGroupId);
      } else {
        this.$emit("on-change", this.roleGroupId[0]);
      }
    },
    clearSelect() {
      this.roleGroupId = [];
      this.roleGroupTitle = "";
      this.initRoleGroupData();
      if (this.multiple) {
        this.$emit("on-change", []);
      } else {
        this.$emit("on-change", "");
      }
      this.$emit("on-clear");
    },
    setData(ids, title) {
      this.roleGroupTitle = title;
      if (this.multiple) {
        this.roleGroupId = ids;
      } else {
        this.roleGroupId = [];
        this.roleGroupId.push(ids);
      }
      this.$emit("on-change", this.roleGroupId);
    }
  },
  mounted() {
    this.initRoleGroupData();
  }
};
</script>

<style lang="less">
.roleGroup-tree-bar {
  position: relative;
  min-height: 80px;
  max-height: 500px;
  overflow: auto;
  margin-top: 5px;
}

.roleGroup-tree-bar::-webkit-scrollbar {
  width: 6px;
  height: 6px;
}

.roleGroup-tree-bar::-webkit-scrollbar-thumb {
  border-radius: 4px;
  -webkit-box-shadow: inset 0 0 2px #d1d1d1;
  background: #e4e4e4;
}
</style>

