<template>
  <div>
    <!-- <span style="color:#ff0000">当前选择人员：{{form.username}}</span> -->
    <!-- {{departmentNameData}} -->
    <card>
      <div v-if="form.status==-2">
          <span style="color:#ff0000;font-size:26px;">当前尚未选择人员</span>
      </div>
      <div v-else>
         <span style="color:#ff0000;font-size:26px;"> 当前选择人员： {{form.name}}</span>
      </div>
    </card>
    <card>
      <div v-if="form.status==-2">
          当前人员状态：未选择用户
      </div>
      <div v-else-if="form.status==0">
          <span style="color:#00BFFF;font-size:26px;">当前人员状态：正常参保</span>
      </div>
      <div v-else>
         <span style="color:#ff0000;font-size:26px;"> 当前人员状态： 已停保</span>
      </div>
    </card>

    <card>
      
      <div v-if="form.status==-2">
        <span style="color:#ff0000;font-size:26px;">退保操作：</span>未选择用户
      </div>
      <div v-else-if="form.status==0">
        <span style="color:#ff0000;font-size:26px;">退保操作：</span><Button @click="lizhi" type="error" :size="large">退保</Button>
      </div>
      <div v-else>
        <span style="color:#ff0000;font-size:26px;">退保操作：</span><Button @click="fuzhi" type="warning" :size="large">参保</Button>
      </div>
    </card>
    <card>
      <div v-if="form.status==-2">
          <span style="color:#ff0000;font-size:26px;">当前尚未选择人员</span>
      </div>
      <div v-else>
         <span style="color:#ff0000;font-size:26px;"> 永久删除：</span>
         <Button @click="deleteOneUser" type="error" :size="large">永久删除</Button>
      </div>
    </card>
  </div>
</template>

<script>
import {
  getRosterOne,
  fu,
  tui,
  deleteOne
} from '../../../api/index.js';
import {getDepartmentList,getUserByDepId,deleteDingUser,updateDingUser,getOneHua} from "./index";
import addEditUser from './addEditUser';
// 编辑保安管理范围列表组件
export default {
  name: "anbao-fanwei",
  components: {
    addEditUser
  },
  data() {
    return {
      departmentNameData:'未选择',
      form:{
        status: '-2',
      }
    }
  },
  methods: {
    init() {
      // this.getUserList();
    },
    deleteOneUser(){
      var that = this;
      this.$Modal.confirm({
        title: "永久删除！",
        content: "您确定要永久删除该用户?",
        loading: true,
        onOk: () => { 
          deleteOne({id:that.form.id}).then(res => {
            this.$Modal.remove();
            if (res.success) {
              this.$Message.success("删除成功");
              that.getUserList();
            }
          })
        }
      });
    },
    getUserList(){
      getRosterOne({id:this.departmentNameData}).then(res =>{
        console.log(res);
        this.form = res.result;
      })
    },
    lizhi(){
      this.$Modal.confirm({
        title: "确认退保",
        content: "您确认要退出保险?",
        loading: true,
        onOk: () => { 
          tui({id: this.departmentNameData}).then(res => {
            this.$Modal.remove();
            if (res.success) {
              this.$Message.success("退保成功");
              this.getUserList();
            }
          });
          // this.$Modal.remove();
        }
      });
    },
    fuzhi(){
      this.$Modal.confirm({
        title: "确认参保",
        content: "您确认要参加保险?",
        loading: true,
        onOk: () => { 
          fu({id: this.departmentNameData}).then(res => {
            this.$Modal.remove();
            if (res.success) {
              this.$Message.success("参保成功");
              this.getUserList();
            }
          });
          // this.$Modal.remove();
        }
      });
    }
  },
  mounted() {
    this.init();
  },
  props: ['departmentName'],
  watch:{
      departmentName:function(newVal,oldVal){
        this.departmentNameData = newVal;
        this.getUserList();
      }
  },
   
}
</script>

<style>

</style>
