<template>
  <div class="user-edit">
    <!-- Drawer抽屉 -->
    <Drawer :title="title" v-model="visible" width="720" draggable :mask-closable="type=='0'">
      <div :style="{maxHeight: maxHeight}" class="drawer-content">
        <div class="user-title">
          <div class="info-title">基本信息</div>
          <Avatar :src="form.avatar" size="large" v-show="type!='2'" />
        </div>
        <Form label-colon v-show="type!='2'">
          <Row :gutter="32">
            <Col span="12">
              <FormItem label="用户ID">
                {{form.id}}
                <Tooltip trigger="hover" placement="right" content="账户已禁用">
                  <Icon
                    v-show="form.status==-1"
                    type="md-lock"
                    size="18"
                    style="margin-left:10px;cursor:pointer"
                  />
                </Tooltip>
              </FormItem>
            </Col>
            <Col span="12">
              <FormItem label="登录账号">
                {{form.username}}
                <Tooltip trigger="hover" placement="right" :content="`密码强度：${form.passStrength}`">
                  <Icon
                    v-show="form.passStrength"
                    type="md-key"
                    :color="passColor"
                    size="18"
                    style="margin-left:10px;cursor:pointer"
                  />
                </Tooltip>
              </FormItem>
            </Col>
          </Row>
        </Form>
        <Form ref="form" :model="form" :rules="formValidate" label-position="top">
          <Row :gutter="32" v-if="type=='1'" >
            <Col span="12">
              <FormItem label="人员ID">
                <Input v-model="form.id" disabled/>
              </FormItem>
            </Col>
          </Row>
          <Row :gutter="32" >
            
            <Col span="12">
              <FormItem label="姓名" prop="name">
                <Input v-model="form.name" placeholder="参保人员的姓名" />
              </FormItem>
            </Col>
            <Col span="12">
              <FormItem label="手机号" prop="mobile">
                <Input v-model="form.mobile" placeholder="参保人员的手机号" />
              </FormItem>
            </Col>
            <Col span="12">
              <FormItem label="身份证号码">
                <Input v-model="form.identity" placeholder="参保人员的身份证号码"/>
              </FormItem>
            </Col>
            <Col span="12">
              <FormItem label="社保卡号">
                <Input v-model="form.cardNumber" placeholder="参保人员的社保卡号" />
              </FormItem>
            </Col>
            <Col span="12">
              <FormItem label="家庭地址">
                <Input v-model="form.address" placeholder="参保人员的家庭地址" />
              </FormItem>
            </Col>
            <Col span="12">
              <FormItem label="保险类型">
                <Select v-model="form.insuranceType">
                  <Option
                    v-for="(item, i) in this.baoXianLeiList"
                    :key="i"
                    :value="item.id"
                  >{{item.name}}</Option>
                </Select>
              </FormItem>
            </Col>
          </Row>
          <Divider />
          
          <Row :gutter="80" v-show="type!='0'" style="padding-left:10px;">
            <Col span="4">
              <Button type="primary" :loading="submitLoading" @click="submit">提交</Button>
            </Col>
            <Col span="4">
              <Button @click="visible = false" >取消</Button>
            </Col>
          </Row>
        </Form>
      </div>
    </Drawer>
  </div>
</template>

<script>
import {
  addRoster,
  getAllInsurance
} from '../../../api/index.js';
import { 
  getAllRoleList, editHuaOnDing,checkTel,getAllShangBao,getAllSheBao,newaddHuaOnDing1} from "./index";
import {
  validateMobile,
} from "@/libs/validate";
import uploadPicInput from "@/views/my-components/zwz/upload-pic-input";
import SetPassword from "@/views/my-components/zwz/set-password";
export default {
  name: "user",
  components: {
    uploadPicInput,
    SetPassword
  },
  props: {
    value: {
      type: Boolean,
      default: false
    },
    data: {
      type: Object
    },
    type: {
      type: String,
      default: "0"
    }
  },
  data() {
    return {
      visible: this.value,
      title: "",
      passColor: "",
      submitLoading: false,
      maxHeight: 510,
      form: {
        identity:'',
        name:'',
        address: '',
        mobile: '',
        cardNumber: '',
        insuranceType: '',
        address: ''
      },
      formValidate: {
        // 表单验证规则
        name: [
          { required: true, message: "请输入姓名", trigger: "blur" },
        ],
        inTime: [
          { required: true, message: "请选择入职日期", trigger: "blur" }
        ],
        hetongRiqi: [
          { required: true, message: "请选择合同日期", trigger: "blur" }
        ],
        mobile: [
          { required: true, message: "请输入手机号", trigger: "blur" },
          { validator: validateMobile, trigger: "blur" }
        ],
        shebaoFou: [
          { required: true, message: "请选择社保", trigger: "blur" }
        ],
        shangBao: [
          { required: true, message: "请选择商保", trigger: "blur" }
        ],
        zuSu: [
          { required: true, message: "请输入住宿", trigger: "blur" }
        ],
        xiuJia: [
          { required: true, message: "请输入休假", trigger: "blur" }
        ]
      },
      
      roleList: [],
      RuZhiDateTemp:'请选择入职日期',
      ischangeRuZhiDate:false,
      hetongRiqiTemp:'请选择合同日期',
      ischangeHetongRiqiDate:false,
      shangBaoList:[],
      sheBaoList:[],
      sheZhiBuMen:false,
      guiShuList:[],
      baoXianLeiList:[],
    };
  },
  methods: {
    init() {
      this.getAllInsuranceFx();
    },
    getAllInsuranceFx(){
      getAllInsurance().then(res => {
        this.baoXianLeiList = res.result;
      })
    },
    changeShiYong(){
      var qi = this.form.syq;
      var a = new Date(this.form.inTimeTemp);
      var year = a.getFullYear();
      var mouth = a.getMonth() + 1 + qi;
      var day = a.getDate();
      if(mouth > 12) {
        mouth -= 12;
        year += 1;
      }
      this.form.zhuanZheng = year + '-' + mouth + '-' + day;
    },
    changeHeTongQiXian(){
      var qi = parseInt(this.form.hetongQixian);
      var a = new Date(this.form.hetongRiqiTemp);
      var year = a.getFullYear() + qi;
      var mouth = a.getMonth() + 1;
      var day = a.getDate();
      this.form.hetongDaoqi = year + '-' + mouth + '-' + day;
    },
    changeGuaKaoDepartment(e){
      if(e == true){
        // 设置部门
        this.sheZhiBuMen = true;
      }else{
        this.sheZhiBuMen = false;
      }
    },
    getAllShangBao(){
      getAllShangBao().then(res =>{
        this.shangBaoList = res.result;
      })
    },
    getAllSheBao(){
      getAllSheBao().then(res =>{
        this.sheBaoList = res.result;
      })
    },
    changeRuZhiDate(){
      this.ischangeRuZhiDate = true;
      var a = new Date(this.form.inTimeTemp);
      this.form.inTime = a.getFullYear() + '-' + (a.getMonth() + 1) + '-' + a.getDate();
      // this.form.syq = 1;
      // this.changeShiYong();
    },
    getRoleList() {
      getAllRoleList().then(res => {
        if (res.success) {
          this.roleList = res.result;
        }
      });
    },
    changeHetongRiqi(){
      this.ischangeHetongRiqiDate = true;
      var b = new Date(this.form.hetongRiqiTemp);
      this.form.hetongRiqi = b.getFullYear() + '-' + (b.getMonth() + 1) + '-' + b.getDate();
    },
    handleSelectDepTree(v) {
      this.form.departmentIdsNew = '';
      var array = v;
      for(var i = 0 ; i < array.length ; i ++){
        if(i == 0) this.form.departmentIdsNew += array[i];
        else this.form.departmentIdsNew += "," + array[i];
      }
    },
    changeAddress(v) {
      this.form.address = JSON.stringify(this.form.addressArray);
    },
    changePass(v, grade, strength) {
      this.form.passStrength = strength;
    },
    changeBirth(v, d) {
      this.form.birth = v;
    },
    submit() {
      var flag = true;
      if(this.form.mobile == ""){
        this.$Message.error("请填写手机号");
        flag = false;
      }
      if(flag == false) return ;
      if(this.type == 1){
        this.submitLoading = true;
        editHuaOnDing(this.form).then(res => {
          this.submitLoading = false;
          if (res.success) {
            this.$Message.success("修改成功");
            this.$emit("on-submit", true);
            this.visible = false;
          }
        });
      }
      else{
        this.submitLoading = true;
        addRoster(this.form).then(res => {
          this.submitLoading = false;
          if (res.success) {
            this.$Message.success("添加成功");
            this.$emit("on-submit", true);
            this.visible = false;
          }
        });
      }
    },
    submit1() {
      var flag = true;
      if(this.form.syq == ""){
        this.$Message.error("请填写试用期");
        flag = false;
      }
      if(this.form.mobile == ""){
        this.$Message.error("请填写手机号");
        flag = false;
      }
      checkTel({tel: this.form.mobile}).then(res =>{
        if(res == false){
          this.$Message.error("手机号码已存在");
          flag = false;
          return ;
        }
      })
      if(flag == false) return ;
      if(this.ischangeRuZhiDate == false){
        this.$Message.error("请填写入职日期");
        flag = false;
      }
      if(flag == false) return ;
      if(this.ischangeHetongRiqiDate == false){
        this.$Message.error("请填写合同日期");
        flag = false;
      }
      
      if(flag == false) return ;
      if(this.type == 1){
        this.submitLoading = true;
        editHuaOnDing(this.form).then(res => {
          this.submitLoading = false;
          if (res.success) {
            this.$Message.success("修改成功");
            this.$emit("on-submit", true);
            this.visible = false;
          }
        });
      }
      else{
        this.submitLoading = true;
        newaddHuaOnDing1(this.form).then(res => {
          this.submitLoading = false;
          if (res.success) {
            this.$Message.success("添加成功");
            this.$emit("on-submit", true);
            this.visible = false;
          }
        });
      }
    },
    setCurrentValue(value) {
      if (value === this.visible) {
        return;
      }
      if (this.type == "1") {
        this.title = "编辑花名册";
        this.maxHeight = Number(document.documentElement.clientHeight - 121) + "px";
      } else if (this.type == "2") {
        this.title = "添加花名册";
        this.maxHeight = Number(document.documentElement.clientHeight - 121) + "px";
      } else {
        this.title = "花名册详情";
        this.maxHeight = "100%";
      }
      this.$refs.form.resetFields();
      if (this.type == "0" || this.type == "1") {
        let data = this.data;
        this.form.id = data.id;
        this.form.name = data.name;
        this.form.parentid = data.parentid;
      } 
      else {
      }
      
      this.visible = value;
      
    }
  },
  watch: {
    value(val) {
      this.setCurrentValue(val);
    },
    visible(value) {
      this.$emit("input", value);
    }
  },
  mounted() {
    this.init();
  }
};
</script>

<style lang="less">
@import "../../../styles/table-common.less";
.drawer-content {
  overflow: auto;
}
.drawer-content::-webkit-scrollbar {
  display: none;
}
.user-title {
  display: flex;
  align-items: center;
  margin-bottom: 16px;
  .info-title {
    font-size: 16px;
    color: rgba(0, 0, 0, 0.85);
    display: block;
    margin-right: 16px;
  }
}
.info-header {
  font-size: 16px;
  color: rgba(0, 0, 0, 0.85);
  display: block;
  margin-bottom: 16px;
}
</style>

