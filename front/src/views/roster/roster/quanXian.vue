<template>
  <div>
    <!-- <span style="color:#ff0000">当前选择人员：{{form.username}}</span> -->
    <!-- {{departmentNameData}} -->
    <card>
      <div>
        <Form ref="form" :model="form" :rules="formValidate" label-position="top">
          <Row :gutter="32">
            <span v-show="!isEdit" style="font-size:28px;color:#f00;">保存后该员工会被还原至无权限状态，等待系统管理员重新分配权限，请谨慎操作！</span>
          </Row>
          <Row :gutter="32">
            <Divider>
              <Button v-show="!isEdit" type="error" size="large" :loading="submitLoading" @click="submit">保存提交</Button>
              <Button v-show="isEdit" type="error" size="large" :loading="submitLoading" @click="beginEdit">开始编辑</Button>
            </Divider>
          </Row>
          <Row :gutter="32">
            <Col span="24">
              <FormItem label="预设OA权限">
                <roleGroupTreeChoose :v-show="isEdit" @on-change="handleSelectRoleGroupTree"
                  ref="roleGroupTree" style="margin-left:10px;width:280px">
                </roleGroupTreeChoose>
                <Select :disabled="isEdit" multiple style="margin-left:10px;width:280px" @on-change="changeOaRoles">
                  <Option
                    v-for="item in roleList"
                    :value="item.id"
                    :key="item.id"
                    :label="item.name"
                  >
                    <span style="margin-right:10px;">{{ item.name }}</span>
                    <span style="color:#ccc;">{{ item.description }}</span>
                  </Option>
                </Select>
              </FormItem>
            </Col>
            <Col span="24">
              <FormItem label="预设其他系统权限">
                <elseroleTreeChoose @on-change="handleSelectRoleGroupTree1"  :multiple="true"
                  ref="roleGroupTree1" style="margin-left:10px;width:280px">
                </elseroleTreeChoose>
                <!-- <Select multiple style="margin-left:10px;width:280px" @on-change="changeOaRoles1">
                  <Option
                    v-for="item in roleList1"
                    :value="item"
                    :key="item.id"
                    :label="item.name"
                  >
                    <span style="margin-right:10px;">{{ item.name }}</span>
                    <span style="color:#ccc;">{{ item.description }}</span>
                  </Option>
                </Select> -->
              </FormItem>
            </Col>
          </Row>
          <Row :gutter="32">
            <Col span="24">
              <FormItem label="自定义备注">
                <Input v-model="zidingyi" type="textarea" :rows="4" placeholder="如果需要额外说明，请填写此栏目!" @on-change="changeMyQuan" :disabled="isEdit" />
              </FormItem>
            </Col>
          </Row>
          <Row :gutter="32">
            <Col span="24">
              <FormItem label="权限详情">
                <Input v-model="form.quanXianData" type="textarea" :rows="6" placeholder="请在上方选择赋予此人的预分配权限!" readonly :disabled="isEdit"/>
              </FormItem>
            </Col>
          </Row>
        </Form>
        
      </div>
    </card>
  </div>
</template>

<script>
import { getRoleList,getAllRoleGroupList,getAllRoleList,getElseJueSeList,getAllElseJueSeList,getAllElseJueList} from "@/api/index";
import {getDepartmentList,getUserByDepId,deleteDingUser,updateDingUser,getOneHua,addHua,editHuaOnDing,savequanXian,getOneRole,getOneElse} from "./index";
import addEditUser from './addEditUser';
import roleGroupTreeChoose from "./rolegroup-tree-choose";
import elseroleTreeChoose from "./elserole-tree-choose";
// 编辑保安管理范围列表组件
export default {
  name: "anbao-fanwei",
  components: {
    addEditUser,
    roleGroupTreeChoose,
    elseroleTreeChoose,
  },
  data() {
    return {
      isEdit:true,
      changeBirthday:false,
      birthdayTemp: '请选择生日',
      departmentNameData:'未选择',
      form:{
        id:'未选择',
        quanXianData:'',
        myQuan:''
      },
      roleList: [],
      oaroles:'',
      roleList1: [],
      elseroles:'',
      zidingyi:'',
    }
  },
  methods: {
    init() {
    },
    changeMyQuan(){
      this.form.myQuan = this.zidingyi;
      this.form.quanXianData =  "OA权限 : " + this.form.quanoaData + '\n其他系统权限 : ' + this.form.quanElseData + '\n自定义备注: ' + this.form.myQuan;
    },
    changeOaRoles(e){
      var that = this;
      // console.log(e);
      that.oaroles = 'OA权限 : ';
      for(var i = 0 ; i < e.length; i ++){
        getOneRole({id: e[i]}).then(res => {
          var itemData = res.result;
          that.form.quanoaData += itemData.roleGroupName + '-' + itemData.name + '(' + itemData.description + '), ';
          that.form.quanXianData = "OA权限 : " + that.form.quanoaData + '\n其他系统权限 : ' + that.form.quanElseData + '\n自定义备注: ' + that.form.myQuan; // 总
        });
      }
    },
    getRoleList() {
      var that = this;
      getAllRoleList().then(res => {
        if (res.success) {
          that.roleList = res.result;
        }
      });
    },
    getRoleListByRoleGroupId(roleGroupId) {
      // console.log('aaa');
      if(roleGroupId==undefined||roleGroupId=="") 
        return [];
      let params = {
        PageVo:{
          pageNumber: 1,
          pageSize: 1000,
          sort: this.sortColumn,
          order: this.sort
        },
        roleGroupId:roleGroupId
      };
      getRoleList(params).then(res => {
        this.loading = false;
        if (res.success) {
          this.roleList = res.result.content;
        }
      });
    },
    handleSelectRoleGroupTree(v) {
      this.form.roleGroupId = v;
      this.getRoleListByRoleGroupId(v);
    },
    handleSelectRoleGroupTree1(v) {
      var that = this;
      that.elseroles = "其他系统权限 ： ";
      for(var i = 0 ; i < v.length; i ++){
        getOneElse({id:v[i]}).then(res => {
          var itemData = res.result;
          that.form.quanElseData += itemData.title + '(' + itemData.requirement + '), '; 

          that.form.quanXianData = "OA权限 : " + that.form.quanoaData + '\n其他系统权限 : ' + that.form.quanElseData + '\n自定义备注:' + that.form.myQuan; //总
        });
      }
    },
    beginEdit() {
      this.isEdit = false;
    },
    getUserList(){
      getOneHua({id:this.departmentNameData}).then(res =>{
        this.form = res.result;
        this.zidingyi = this.form.myQuan;
        this.form.quanXianData = "OA权限 : " + this.form.quanoaData + '\n其他系统权限 : ' + this.form.quanElseData + '\n自定义备注:' + this.form.myQuan;
      })
    },
    submit() {
      this.$Modal.confirm({
        title: "确认重置预设权限?",
        content: "保存后该员工会被还原至无权限状态，等待系统管理员重新分配权限，请谨慎操作！",
        loading: true,
        onOk: () => {
          savequanXian(this.form).then(res =>{
            this.$Modal.remove();
            this.isEdit = true;
          })
        }
      });
    },
    calAge() {
      this.changeBirthday = true;
      this.birthdayTemp = this.form.birthday;
      var a = new Date(this.form.birthday);
      this.form.age = new Date().getFullYear() - a.getFullYear() + 1;
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
      },
      isEdit:function(newVal){
        if(newVal == false){
          this.form.quanoaData = "";
          this.form.quanElseData = "";
        }
      }
  },
   
}
</script>

<style>

</style>
