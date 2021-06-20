<template>
  <div>
    <!-- <span style="color:#ff0000">当前选择人员：{{form.username}}</span> -->
    <!-- {{departmentNameData}} -->
    <card>
      <div>
        <Button type="error" @click="ShowAddFuJian">上传附件</Button>
        <Button type="info" @click="f5">刷新</Button>
        <Row>
        <Table
          :loading="loading"
          border
          :columns="columns"
          :data="fileData"
          sortable="custom"
          @on-sort-change="changeSort"
          @on-selection-change="showSelect"
          ref="table"
        ></Table>
      </Row>
      <Row type="flex" justify="end" class="page">
        <Page
          :current="searchForm.pageNumber"
          :total="total"
          :page-size="searchForm.pageSize"
          @on-change="changePage"
          @on-page-size-change="changePageSize"
          :page-size-opts="[10,20,50]"
          size="small"
          show-total
          show-elevator
          show-sizer
        ></Page>
      </Row>
      </div>
    </card>
    <Modal
        v-model="isShowAddFuJian"
        title="新增附件"
        @on-ok="updateFuJian"
        @on-cancel="updateFuJiancancel">
        <span>请输入要上传的附件名称</span>
        <input v-model="addFuJianNameTemp" />
    </Modal>

  </div>
</template>

<script>
import {getDepartmentList,getUserByDepId,getFuJianData,getOneHuaGang,addFuJian,deleteFuJian,getOneHua} from "./index";
export default {
  name: "fujian",
  components: {
  },
  data() {
    return {
      isEdit:true,
      form:{
        id:'未选择',
      },
      fujianform:{
        id:'',
        name:'',
      },
      searchForm: {
        huaId:'',
        pageNumber: 1,
        pageSize: 10,
        sort: "createTime",
        order: "desc"
      },
      addFuJianNameTemp:'',
      isShowAddFuJian: false,
      fileData:[],
      columns: [
        {
          title: '序号',
          width: 80,
          align: "center",
          fixed: "left",
          sortType:true,
          sortable: true,
          render: (h,params) => {
            return h('span',params.index + (this.searchForm.pageNumber-1)*this.searchForm.pageSize + 1 )
          }
        },
        {
          title: "姓名",
          key: "huaName",
          minWidth: 80,
          align: "center",
          sortable: true,
        },
        {
          title: "资料名称",
          key: "dataName",
          minWidth: 100,
          align: "center",
          sortable: true,
        },
        {
          title: "下载",
          key: "isHave",
          minWidth: 100,
          sortable: true,
          render: (h, params) => {
            var that = this;
            let fujianid = params.row.id;
            if(params.row.isHave == 1){
              return h("div", [
                h(
                  "Button",
                  {
                    props: {
                      type: "info",
                      size: "small"
                    },
                    style: {
                      marginRight: "5px"
                    },
                    on: {
                      click: () => {
                        window.open("https://artskyhome.com/xboot/huaFuJian/downloadFile/" + fujianid,"_blank");
                        this.f5();
                      }
                    }
                  },
                  "下载"
                ),
                h(
                  "Button",
                  {
                    props: {
                      type: "error",
                      size: "small"
                    },
                    style: {
                      marginRight: "5px"
                    },
                    on: {
                      click: () => {
                        this.deteleFuJian(fujianid);
                      }
                    }
                  },
                  "删除"
                )
              ])
            }else{
              return h("div", [
                h(
                  "Upload",
                  {
                    props: {
                      type: "drag",
                      icon: "ios-cloud-upload-outline",
                      action:'/xboot/huaFuJian/file/' + fujianid,
                      data:{

                      },
                      'on-success':that.uploadFuJianSuccess,
                      'on-error':that.uploadFuJianError,
                      'before-upload':that.uploadFuJianBefore,
                      'on-progress':that.uploadFuJianProgress,
                    },
                  },
                  "上传"
                )
              ])
            }
          }
        },
        {
          title: "创建时间",
          key: "createTime",
          minWidth: 100,
          align: "center",
          sortable: true,
        },
      ],
    }
  },
  methods: {
    init() {
      
    },
    getFuJianData(){
      getFuJianData(this.searchForm).then(res =>{
        // //console.log("getFuJianData");
        // //console.log(res);
        this.fileData = res.result.records;
      })
    },
    getOneHuaGang(){
      getOneHua({id:this.departmentNameData}).then(res =>{
        //console.log(this.departmentNameData);
        
        this.form = res.result;
        // //console.log(this.form);
      })
    },
    updateFuJian(){
      this.fujianform.huaId = this.form.id;
      this.fujianform.huaName = this.form.username;
      this.fujianform.dataName = this.addFuJianNameTemp;
      this.fujianform.isHave = 0;
      addFuJian(this.fujianform).then(res =>{
        this.f5();
      });
      this.f5();
      this.isShowAddFuJian = false;
    },
    updateFuJiancancel(){
      this.isShowAddFuJian = false;
    },
    ShowAddFuJian(){
      this.isShowAddFuJian = true;
    },
    uploadFuJianError(res,file){

    },
    uploadFuJianSuccess(){
      //console.log("uploadFuJianSuccess");
      this.f5();
    },
    f5(){
      this.getFuJianData();
    },
    deteleFuJian(fujianid){
      this.$Modal.confirm({
        title: "确认删除",
        content: "您确认要删除该附件吗?",
        loading: true,
        onOk: () => {
          deleteFuJian({ids: fujianid}).then(res => {
            this.$Modal.remove();
            if (res.success) {
              this.$Message.success("删除成功");
              this.f5();
            }
          });
        }
      });
    },
  },
  mounted() {
    this.init();
  },
  props: ['departmentName'],
  watch:{
    departmentName:function(newVal,oldVal){
      this.departmentNameData = newVal;
      this.getOneHuaGang();
      this.searchForm.huaId = newVal;
      this.getFuJianData();
    }
  },
}
</script>
<style>
</style>
