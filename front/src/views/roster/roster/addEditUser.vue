<template>
  <div class="user-edit">
    <Drawer :title="title" v-model="visible" width="720" draggable :mask-closable="type=='0'">
      <!-- Drawer抽屉 1234{{data}}--type={{type}}-->
      <!-- {{from}} -->
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
          <Row :gutter="32">
            <Col span="12">
              <FormItem label="员工工号">
                <Input v-model="form.jobnumber"  />
              </FormItem>
            </Col>
            <Col span="12">
              <FormItem label="员工姓名">
                <Input v-model="form.name" />
              </FormItem>
            </Col>
          </Row>

          <Row :gutter="32">
            <Col span="12">
              <FormItem label="员工职位">
                <Input v-model="form.position"  />
              </FormItem>
            </Col>
            <Col span="12">
              <FormItem label="工作地点">
                <Input v-model="form.workPlace" />
              </FormItem>
            </Col>
          </Row>

          <Row :gutter="32">
            <Col span="12">
              <FormItem label="电话号码">
                <Input v-model="form.mobile"  />
              </FormItem>
            </Col>
            <Col span="12">
              <FormItem label="电话短号">
                <Input v-model="form.tel" />
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
      <!-- <div class="drawer-footer br" v-show="type!='0'">
        <Button type="primary" :loading="submitLoading" @click="submit">提交</Button>
        <Button @click="visible = false">取消</Button>
      </div> -->
    </Drawer>
  </div>
</template>

<script>
import { getAllRoleList, addUser, editUser,addDingDingDepartment, addDingUser,updateDingUser} from "./index";
import {
  validateUsername,
  validateMobile,
  validatePassword
} from "@/libs/validate";
import departmentTreeChoose from "@/views/my-components/xboot/multDepartment-tree-choose";
import uploadPicInput from "@/views/my-components/xboot/upload-pic-input";
import SetPassword from "@/views/my-components/xboot/set-password";
export default {
  name: "user",
  components: {
    departmentTreeChoose,
    uploadPicInput,
    SetPassword
  },
  props: {
    value: {
      type: Boolean,
      default: false
    },
    data: {
      type: String
    },
    type: {
      type: String,
      default: "0"
    },
    from: {
      type: Object
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
        departmentid:'',
      },
      formValidate: {
        // 表单验证规则
        username: [
          { required: true, message: "请输入登录账号", trigger: "blur" },
          { validator: validateUsername, trigger: "blur" }
        ],
        nickname: [
          { required: true, message: "请输入用户名", trigger: "blur" }
        ],
        mobile: [
          { required: true, message: "请输入手机号", trigger: "blur" },
          { validator: validateMobile, trigger: "blur" }
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          { validator: validatePassword, trigger: "blur" }
        ],
        email: [
          { required: true, message: "请输入邮箱地址" },
          { type: "email", message: "邮箱格式不正确" }
        ]
      },
      roleList: []
    };
  },
  methods: {
    init() {
      this.getRoleList();
    },
    getRoleList() {
      getAllRoleList().then(res => {
        if (res.success) {
          this.roleList = res.result;
        }
      });
    },
    handleSelectDepTree(v) {
      this.form.departmentIds = v;
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

      this.form.departmentid = this.data;
      if(this.type == 1){
        this.submitLoading = true;
        updateDingUser(this.form).then(res => {
          this.submitLoading = false;
          if (res.success) {
            this.$Message.success("更新成功");
            this.$emit("on-submit", true);
            this.visible = false;
          }
        });
      }
      else{
        this.submitLoading = true;
        addDingUser(this.form).then(res => {
          this.submitLoading = false;
          if (res.success) {
            this.$Message.success("新增成功");
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
        this.title = "编辑设备";
        this.maxHeight = Number(document.documentElement.clientHeight - 121) + "px";
      } else if (this.type == "2") {
        this.title = "添加设备";
        this.maxHeight = Number(document.documentElement.clientHeight - 121) + "px";
      } else {
        this.title = "设备详情";
        this.maxHeight = "100%";
      }
      this.$refs.form.resetFields();
      if (this.type == "0" || this.type == "1") {
        let data = this.from;  
        this.form.jobnumber = data.jobnumber;
        this.form.name = data.name;
        this.form.position = data.position;
        this.form.workPlace = data.workPlace;
        this.form.mobile = data.mobile;
        this.form.tel = data.tel;
        this.form.userid = data.userid;
      } else {
        this.form = {
          type: 0,
          sex: "",
        };
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

