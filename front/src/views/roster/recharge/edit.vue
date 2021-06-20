<template>
  <div>
    <Card>
      <div slot="title">
        <div class="edit-head">
          <a @click="close" class="back-title">
            <Icon type="ios-arrow-back" />返回
          </a>
          <div class="head-name">编辑</div>
          <span></span>
          <a @click="close" class="window-close">
            <Icon type="ios-close" size="31" class="ivu-icon-ios-close" />
          </a>
        </div>
      </div>
      <Form ref="form" :model="form" :label-width="100" :rules="formValidate" label-position="left" >        
        <Row :gutter="32">
           <Col span="12" >     
              <FormItem label="保险名称" prop="name"  >
                <Input v-model="form.name" clearable/>
              </FormItem>
            </Col>
            <Col span="12" >     
              <FormItem label="C类大病门诊百分比">
                <InputNumber v-model="form.mine" clearable max="100" min="0"
                :formatter="value => `${value}%`"
                :parser="value => value.replace('%', '')"/>
              </FormItem>
            </Col>
            <Col span="12" >     
              <FormItem label="B类大病门诊百分比">
                <InputNumber v-model="form.common" clearable max="100" min="0"
                :formatter="value => `${value}%`"
                :parser="value => value.replace('%', '')"/>
              </FormItem>
            </Col>
            <Col span="12" >     
              <FormItem label="A类大病门诊百分比">
                <InputNumber v-model="form.big" clearable max="100" min="0"
                :formatter="value => `${value}%`"
                :parser="value => value.replace('%', '')"/>
              </FormItem>
            </Col>
          </Row>
        <Form-item class="br">
          <Button
            @click="handleSubmit"
            :loading="submitLoading"
            type="primary"
          >提交并保存</Button>
          <Button @click="handleReset">重置</Button>
          <Button type="dashed" @click="close">关闭</Button>
        </Form-item>
      </Form>
    </Card>
    <Drawer title="导入花名册数据" closable v-model="isImportHuaData" width="550">
      <car>
        <Row>
          <Form ref="huasearchForm" :model="huasearchForm" inline :label-width="70">
            <Form-item label="姓名">
              <Input
                type="text"
                v-model="huasearchForm.username"
                clearable
                placeholder="请输入姓名"
                style="width: 200px"
              />
            </Form-item>
            <Form-item>
              <Button @click="huahandleSearch" type="primary" icon="ios-search">搜索</Button>
              <Button @click="huahandleReset">重置</Button>
            </Form-item>
          </Form>
        </Row>
        <Row v-show="openTip">
          <Alert show-icon>
            已选择
            <span class="select-count">{{huaselectCount}}</span> 项
            <a class="select-clear" @click="huaclearSelectAll">清空</a>
          </Alert>
        </Row>
        <Row>
          <Table
            :loading="hualoading"
            border
            :columns="userColumns"
            :data="huaData"
            sortable="custom"
            @on-sort-change="huachangeSort"
            @on-selection-change="huashowHuaSelect"
            ref="table1"
          ></Table>
          <br>
        </Row>
        <Row type="flex" justify="end" class="page">
          <Page
            :current="huasearchForm.pageNumber"
            :total="huaTotal"
            :page-size="huasearchForm.pageSize"
            @on-change="huachangePage"
            @on-page-size-change="huachangePageSize"
            :page-size-opts="[10,20,50]"
            size="small"
            show-total
            show-elevator
            show-sizer
          ></Page>
        </Row>
        <Button type="primary" @click="huaAddData">从花名册导入</Button> &nbsp;
        <Button @click="isImportHuaData=false">退出</Button>
      </car>
    </Drawer>
  </div>
</template>

<script>
// 根据你的实际请求api.js位置路径修改
import { getByPageNotImport,editMeeting } from "./api.js";
export default {
  name: "edit",
  components: {
    },
  props: {
    data: Object
  },
  data() {
    return {
      submitLoading: false, // 表单提交状态
      form: { // 添加或编辑表单对象初始化数据
        name: "",
        mine: "",
        common: "",
        big: ""
      },
    // 表单验证规则
    formValidate: {
      name: [{ required: true, message: "不能为空", trigger: "blur" }],
      peopleNum: [{ type: "number", required: true, message: "不能为空", trigger: "blur" }],
      zuoBiao: [{ required: true, message: "不能为空", trigger: "blur" }],
      guiGe: [{ required: true, message: "不能为空", trigger: "blur" }],
      haoCai: [{ required: true, message: "不能为空", trigger: "blur" }],
      manger: [{ required: true, message: "不能为空", trigger: "blur" }],
    },
    userColumns: [
        {
          type: "selection",
          width: 55,
          align: "center",
          fixed: "left"
        },
        {
          title: "姓名",
          key: "username",
          width: 100,
          sortable: true
        },
        {
          title: "联系电话",
          key: "telpublic",
          width: 140,
          sortable: true
        },
        {
          title: "创建时间",
          key: "createTime",
          sortable: true,
          sortType: "desc",
          width: 200
        }
      ],
      shiOrLing:'',
      isImportHuaData:false,
      huasearchForm: {
        pageNumber: 1,
        pageSize: 10,
        username: ""
      },
      exportHuaData :[],
      selectHuaList :[],
      selectHuaCount :[],
      huaData:[], //花名册组件的数据
    };
  },
  methods: {
    init() {
      this.handleReset();
      this.form = this.data;
    },
    showHuaModel(){
      this.shiOrLing = "ling";
      this.getHuaUserList();
      this.isImportHuaData = true;
    },
    huaAddData() {
      var that = this;
      if (this.huaselectCount <= 0) {
        this.$Message.warning("您还未选择要从花名册导入的数据");
        return;
      }
      let ids = "";
      this.huaselectList.forEach(function(e) {
        ids += e.username + ",";
      });
      ids = ids.substring(0, ids.length - 1);
      this.$Message.success("导入成功");
      this.isImportHuaData=false;
      that.form.manger = ids;
    },
    getHuaUserList() {
      this.hualoading = true;
      getByPageNotImport(this.huasearchForm).then(res => { // getHuaListData
        this.hualoading = false;
        if (res.success) {
          this.huaData = res.result.records;
          this.huaTotal = res.result.total;
        }
      });
    },
    huachangePage(v) {
      this.huasearchForm.pageNumber = v;
      this.getHuaUserList();
      this.huaclearSelectAll();
    },
    huachangePageSize(v) {
      this.huasearchForm.pageSize = v;
      this.getHuaUserList();
    },
    huahandleSearch() {
      this.huasearchForm.pageNumber = 1;
      this.huasearchForm.pageSize = 10;
      this.getHuaUserList();
    },
    huahandleReset() {
      this.$refs.huasearchForm.resetFields();
      this.huasearchForm.username = '';
      this.huasearchForm.pageNumber = 1;
      this.huasearchForm.pageSize = 10;
      this.getHuaUserList();
    },
    huachangeSort(e) {
      this.huasearchForm.sort = e.key;
      this.huasearchForm.order = e.order;
      if (e.order == "normal") {
        this.searchForm.order = "";
      }
      this.getHuaUserList();
    },
    huashowHuaSelect(e) {
      this.huaselectList = e;
      this.huaselectCount = e.length;
    },
    huaclearSelectAll() {
      this.$refs.table1.selectAll(false);
    },
    handleReset() {
      this.$refs.form.resetFields();
    },
    handleSubmit() {
      this.$refs.form.validate(valid => {
        if (valid) {
          editMeeting(this.form).then(res => {
            this.submitLoading = false;
            if (res.success) {
              this.$Message.success("操作成功");
              this.submited();
            }
          });
        }
      });
    },
    close() {
      this.$emit("close", true);
    },
    submited() {
      this.$emit("submited", true);
    }
  },
  mounted() {
    this.init();
  }
};
</script>
<style lang="less">
// 建议引入通用样式 具体路径自行修改 可删除下面样式代码
// @import "../../../styles/single-common.less";
.edit-head {
    display: flex;
    align-items: center;
    justify-content: space-between;
    position: relative;

    .back-title {
        color: #515a6e;
        display: flex;
        align-items: center;
    }

    .head-name {
        display: inline-block;
        height: 20px;
        line-height: 20px;
        font-size: 16px;
        color: #17233d;
        font-weight: 500;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .window-close {
        z-index: 1;
        font-size: 12px;
        position: absolute;
        right: 0px;
        top: -5px;
        overflow: hidden;
        cursor: pointer;

        .ivu-icon-ios-close {
            color: #999;
            transition: color .2s ease;
        }
    }

    .window-close .ivu-icon-ios-close:hover {
        color: #444;
    }
}
</style>