<template>
  <div>
    <div style="display:flex;">
      <!-- {{nowData}}123 -->
      <Input
        v-model="departmentTitle"
        readonly
        style="margin-right:10px;"
        :placeholder="placeholder"
        :clearable="clearable"
        @on-clear="clearSelect"
      />
      <!-- {{nowData}} -->
      <Poptip transfer trigger="click" placement="right" title="选择部门" width="250">
        <Button icon="md-list">选择部门</Button>
        <div slot="content">
          <Input
            v-model="searchKey"
            suffix="ios-search"
            @on-change="searchDep"
            placeholder="输入部门名搜索"
            clearable
          />
          <div class="dep-tree-bar">
            <Tree
              :data="dataDep"
              :load-data="loadData"
              @on-select-change="selectTree"
              :multiple="true"
            ></Tree>
            <Spin size="large" fix v-if="depLoading"></Spin>
          </div>
        </div>
      </Poptip>
    </div>
  </div>
</template>

<script>
import { initDepartment,initDepartment2, loadDepartment, searchDepartment } from "@/api/index";
export default {
  name: "departmentTreeChoose",
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
      default: "点击选择部门"
    },
    nowData: {
      type: String,
      default: ""
    }
  },
  watch: {
    nowData:function(a,b) {
      var that =this;
      if(typeof(a) == 'string'){
        // console.log("watch");
        // console.log(a);
        var aa = a;
        if(aa != ""){
          that.nowData = new Array();
          that.nowData = aa.split(',');
        }
        
        // this.getNowData();
        initDepartment2().then(res => {
          if (res.success) {
            res.result.forEach(function(e) {
              if (e.isParent) {
                e.loading = false;
                e._loading = false;
                // e.children = [];
              }
              // if (e.status == -1) {
              //   e.title = "[已禁用] " + e.title;
              //   e.disabled = true;
              // }
              // console.log(res);
              // res.result[0].children[0].selected = true;
              var selects = that.nowData;
              console.log(selects);
              // selects.push('118385240');
              for(var i = 0 ; i < res.result.length ; i ++){
                var item = res.result[i]; // 一级菜单
                
                    
                for(var z = 0 ; z < selects.length ; z ++){
                  if(selects[z] == item.id){
                    res.result[i].selected = true;
                  }
                }
                for(var j = 0 ; j < item.children.length ; j ++){
                  var item2 = item.children[j]; // 二级菜单
                  for(var z = 0 ; z < selects.length ; z ++){
                    
                    if(selects[z] == item2.id){
                      // console.log(item2.id);
                      res.result[i].children[j].selected = true;
                    }
                  }
                  for(var k = 0 ; k < item2.children.length ; k ++){
                    var item3 = item2.children[k]; // 三级菜单
                    for(var z = 0 ; z < selects.length ; z ++){
                      // console.log(item3.id);
                      if(selects[z] == item3.id){
                        // console.log(item3.id);
                        res.result[i].children[j].children[k].selected = true;
                      }
                    }
                    for(var l = 0 ; l < item3.children.length ; l ++){
                      var item4 = item3.children[l]; // 四级菜单
                      for(var z = 0 ; z < selects.length ; z ++){
                        if(selects[z] == item4.id){
                          item4.selected = true;
                        }
                      }
                    }
                  }
                }
              }
              // res.result[0].selected = true;
            });
            this.dataDep = res.result;
          }
        });
      }
      
    }
  },
  data() {
    return {
      depLoading: false,
      departmentTitle: "",
      searchKey: "",
      dataDep: [],
      selectDep: [],
      departmentId: [],
      nowData:[],
    };
  },
  methods: {
    initDepartmentData() {
      var that  = this;
      initDepartment2().then(res => {
        if (res.success) {
          res.result.forEach(function(e) {
            if (e.isParent) {
              e.loading = false;
              e._loading = false;
              // e.children = [];
            }
            // if (e.status == -1) {
            //   e.title = "[已禁用] " + e.title;
            //   e.disabled = true;
            // }
            // console.log(res);
            
            // var selects = that.nowData;
            // console.log("that.nowData");
            // console.log(that);
            // for(var i = 0 ; i < res.result.length ; i ++){
            //   var item = res.result[i]; // 一级菜单
            //   for(var z = 0 ; z < selects.length ; z ++){
            //     if(selects[z] == item.id){
            //       item.selected = true;
            //     }
            //   }
            //   for(var j = 0 ; j < item.children.length ; j ++){
            //     var item2 = item.children[j]; // 二级菜单
            //     for(var z = 0 ; z < selects.length ; z ++){
            //       if(selects[z] == item2.id){
            //         item2.selected = true;
            //       }
            //     }
            //     for(var k = 0 ; k < item2.length ; k ++){
            //       var item3 = item2.children[k]; // 三级菜单
            //       for(var z = 0 ; z < selects.length ; z ++){
            //         if(selects[z] == item3.id){
            //           item3.selected = true;
            //         }
            //       }
            //       for(var l = 0 ; l < item3.children.length ; l ++){
            //         var item4 = item3.children[l]; // 四级菜单
            //         for(var z = 0 ; z < selects.length ; z ++){
            //           if(selects[z] == item4.id){
            //             item4.selected = true;
            //           }
            //         }
            //       }
            //     }
            //   }
            // }
            // res.result[0].selected = true;
          });
          this.dataDep = res.result;
        }
      });
    },
    loadData(item, callback) {
      loadDepartment(item.id).then(res => {
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
    searchDep() {
      // 搜索部门
      if (this.searchKey) {
        this.depLoading = true;
        searchDepartment({ title: this.searchKey }).then(res => {
          this.depLoading = false;
          if (res.success) {
            res.result.forEach(function(e) {
              if (e.status == -1) {
                e.title = "[已禁用] " + e.title;
                e.disabled = true;
              }
            });
            this.dataDep = res.result;
          }
        });
      } else {
        this.initDepartmentData();
      }
    },
    getNowData(){
      if(this.nowData != ""){
      let ids = [];
      var idss = this.nowData.slice(1,this.nowData.length - 1);
      // console.log("this.nowData   " + this.nowData);
      ids = idss.split(",");
      this.departmentId = ids;
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
      this.departmentId = ids;
      this.departmentTitle = title;
      if (this.multiple) {
        this.$emit("on-change", this.departmentId);
      } else {
        this.$emit("on-change", this.departmentId[0]);
      }
    },
    clearSelect() {
      this.departmentId = [];
      this.departmentTitle = "";
      this.initDepartmentData();
      if (this.multiple) {
        this.$emit("on-change", []);
      } else {
        this.$emit("on-change", "");
      }
      this.$emit("on-clear");
    },
    setData(ids, title) {
      this.departmentTitle = title;
      if (this.multiple) {
        this.departmentId = ids;
      } else {
        this.departmentId = [];
        this.departmentId.push(ids);
      }
      this.$emit("on-change", this.departmentId);
    }
  },
  mounted() {
    this.initDepartmentData();
    
  },
  // onShow(){
  //   this.getNowData();
  // }
};
</script>

<style lang="less">
.dep-tree-bar {
  position: relative;
  min-height: 80px;
  max-height: 500px;
  overflow: auto;
  margin-top: 5px;
}

.dep-tree-bar::-webkit-scrollbar {
  width: 6px;
  height: 6px;
}

.dep-tree-bar::-webkit-scrollbar-thumb {
  border-radius: 4px;
  -webkit-box-shadow: inset 0 0 2px #d1d1d1;
  background: #e4e4e4;
}
</style>

