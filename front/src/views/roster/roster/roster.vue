<style lang="less">
@import "../../../styles/table-common.less";
@import "./roster.less";
</style>
<template>
  <div class="search">
    <BackTop></BackTop>
     <Row :gutter="32">
        <Col>
          <Card>
            <Row v-show="openSearch" @keydown.enter.native="handleSearch">
              <Form ref="searchForm" :model="searchForm" inline :label-width="60">
                <Form-item label="姓名">
                  <Input
                    type="text"
                    v-model="searchForm.name"
                    clearable
                    @on-change="selectByNameFx"
                    placeholder="请输入搜索的姓名"
                    style="width: 160px"
                  />
                </Form-item>
                <Form-item label="身份证">
                  <Input
                    type="text"
                    v-model="searchForm.identity"
                    clearable
                    placeholder="请输入搜索的身份证"
                    style="width: 160px"
                  />
                </Form-item>
                <Form-item style="margin-left:-35px;" class="br">
                  <Button @click="add" type="success" icon="md-add">添加人员</Button>
                  <!-- <Button @click="delAll" icon="md-trash" type="error">批量删除</Button> -->
                  <Button @click="handleSearch" type="warning" icon="ios-search">人员搜索</Button>
                  <Button @click="handleReset" type="error" icon="ios-search">搜索重置</Button>
                  <Button @click="refresh" type="info" icon="ios-search">刷新页面</Button>
                  <!-- <Button @click="importExcelData" type="primary" icon="md-add">导入Excel</Button>
                  <Button @click="outputExcelData" type="primary" icon="md-add">导出Excel</Button> -->
                  <Button type="success" @click="showFilterPanelFlag = !showFilterPanelFlag" >
                    <span class="icon_filter">列显示筛选</span>
                  </Button>
                  <a class="drop-down" @click="dropDown">
                    {{dropDownContent}}
                    <Icon :type="dropDownIcon"></Icon>
                  </a>
                </Form-item>
              </Form>
            </Row>
            <!-- {{selected}} -->
            <transition>
              <div v-show="showFilterPanelFlag" class="filter-panel">
                <CheckboxGroup v-model="selected" >
                  <div v-for="item in mycolumns" :key="item" v-if="item.title!=null">
                    <Checkbox :label="item.title" style="margin: 2px 5px" ></Checkbox>
                  </div>
                </CheckboxGroup>
              </div>
            </transition>
            <Row>
              <Table
                height="300"
                style="width: 100%;"
                :loading="loading"
                border
                :columns="columns"
                :data="data"
                sortable="custom"
                @on-sort-change="changeSort"
                @on-selection-change="showSelect"
                @on-row-click="handleRow"
                highlight-row
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
                :page-size-opts="[5,10,20,30,50]"
                size="small"
                show-total
                show-elevator
                show-sizer
              ></Page>
            </Row>
          </Card>
        </Col>
 
            <Collapse accordion :value="xiala">
              <Panel name="a" class=" ivu-alert-info ivu-alert-with-icon">
                <!-- 详细信息  -->
                <span style="color:#ff0000">当前选择人员：{{nowSelectData.username}}</span>
                <div slot="content" >
                  <Col>
                    <card>
                      <div>
                        <Tabs :value="chooseName" @on-click="changeTab">
                          <TabPane label="基础信息" name="name1">
                            <user  v-bind:departmentName="departmentNameData"  @on-submit="getUserList"></user>
                          </TabPane>
                          <TabPane label="社保情况" name="name2">
                            <gangWei  v-bind:departmentName="departmentNameData"  @on-submit="getUserList"></gangWei>
                          </TabPane>
                          <TabPane label="参保情况" name="name3">
                            <status  v-bind:departmentName="departmentNameData"  @on-submit="getUserList"></status>
                          </TabPane>
                        </Tabs>
                      </div>
                    </card>
                  </Col>
                </div>
              </Panel>
            </Collapse> 
  
     </Row>
    <addEdit :data="form" :type="showType" v-model="showUser" @on-submit="getUserList" />
    <Drawer title="导入数据" closable v-model="importModalVisible" width="1000">
      <div style="display:flex;justify-content: space-between;align-items: center;">
        <Upload action :before-upload="beforeUploadImport" accept=".xls, .xlsx">
          <Button
            :loading="reading"
            icon="ios-cloud-upload-outline"
            style="margin-right:10px"
          >上传Excel文件</Button>
          <span v-if="uploadfile.name">当前选择文件：{{ uploadfile.name }}</span>
        </Upload>
        <Button @click="clearImportData" icon="md-trash">清空数据</Button>
      </div>
      <Alert type="warning" show-icon>导入前请下载查看导入模版数据文件，确保数据格式正确，不得修改列英文名称。必需数据字段：用户名(唯一)、密码(明文)</Alert>
      <Table
        :columns="importColumns"
        border
        :height="height"
        :data="importTableData"
        ref="importTable"
      ></Table>
      <div class="drawer-footer">
        <Button @click="downloadTemple" type="info">下载导入模板</Button>
        <div style="position:absolute;right:15px;display: inline-block">
          <Button @click="importModalVisible=false">关闭</Button>
          <Button
            :loading="importLoading"
            :disabled="importTableData.length<=0"
            @click="importData"
            style="margin-left:8px"
            type="primary"
          >
            确认导入
            <span v-if="importTableData.length>0">{{importTableData.length}} 条数据</span>
          </Button>
        </div>
      </div>
    </Drawer>

  </div>
</template>

<script>
import {
  getAllGuiShu,
  importHuaExcelData,
  getDingUserListData,
  getHuaList,
  addHua,
  deleteHua,
  deleteDingDepartment
} from "./index";
import {
  getRosterList
} from '../../../api/index.js';
import excel from "@/libs/excel";
import departmentChoose from "@/views/my-components/xboot/department-choose";
import { userColumns, userData } from "@/libs/importTemplate";
import addEdit from "./addEdit.vue";
import expandRow from './table-expand.vue';
import user from './user.vue';
import status from './status.vue';
import quanXian from './quanXian.vue';
import gangWei from './gangWei.vue'
import fuJian from './fuJian.vue'
export default {
  name: "jichu-manage",
  components: {
    departmentChoose,
    addEdit,
    user,
    status,
    quanXian,
    gangWei,
    fuJian
  },
  data() {
    return {
      tempRuZhiNo:'',
      nowSelectData:{},
      xiala:'b',
      split1: 0.3,
      chooseName:'name1',
      departmentNameData:'',
      selected:[],
      height: 510,
      showUser: false,
      showAddUser: false,
      showType: "0",
      openSearch: true,
      openTip: true,
      loading: true,
      reading: false,
      importLoading: false,
      loadingExport: true,
      exportModalVisible: false,
      importModalVisible: false,
      drop: false,
      selectCount: 0,
      selectList: [],
      searchForm: {
        pageNumber: 1,
        pageSize: 5,
        status:'0',
        sort: "name",
        order: "desc",
      },
      selectDate: null,
      form: {},
      mycolumns:[],
      columns: [
        {
          title: '序号',
          minWidth: 50,
          align: "center",
          fixed: "left",
          sortType:true,
          render: (h,params) => {
            return h('span',params.index + (this.searchForm.pageNumber-1)*this.searchForm.pageSize + 1 )
          }
        },
        {
          title: "姓名",
          key: "name",
          minWidth: 80,
          align: "center"
        },
        {
          title: "性别",
          key: "sex",
          minWidth: 30,
          align: "center"
        },
        {
          title: "年龄",
          key: "age",
          minWidth: 30,
          align: "center"
        },
        {
          title: "电话号码",
          key: "mobile",
          minWidth: 80,
          align: "center"
        },
        {
          title: "身份证号码",
          key: "identity",
          minWidth: 100,
          align: "center",
        },
        {
          title: "社保卡号",
          key: "cardNumber",
          minWidth: 100,
          align: "center",
        },
        {
          title: "余额",
          key: "balance",
          minWidth: 80,
          align: "center"
        },
        {
          title: "参保保险",
          key: "insuranceName",
          minWidth: 50,
          align: "center"
        },
      ],
      chooseColumns: [],
      exportType: "",
      importTableData: [],
      importColumns: [],
      uploadfile: {
        name: ""
      },
      tempColumns: userColumns,
      tempData: userData,
      data: [],
      total: 0,
      dictSex: this.$store.state.dict.sex,
      showFilterPanelFlag: false,
      importModalVisible:false,
      guiShuList:[],
      drop: false,
      dropDownContent: "展开",
      dropDownIcon: "ios-arrow-down"
      
    };
  },
  methods: {
    init() {
      var that = this;
      this.getUserList();
      this.mycolumns=this.columns;
      this.columns.forEach(function(e) {
        that.selected.push(e.title);
      });
    },
    getUserList() {
      this.loading = true;
      console.log(this.searchForm);
      getRosterList(this.searchForm).then(res => {
        console.log(res);
        this.loading = false;
        this.data = res.result.records;
        this.total = res.result.total;
      });
    },
    dropDown() {
      if (this.drop) {
        this.dropDownContent = "展开";
        this.dropDownIcon = "ios-arrow-down";
      } else {
        this.dropDownContent = "收起";
        this.dropDownIcon = "ios-arrow-up";
      }
      this.drop = !this.drop;
    },
    downloadTemple(){
      window.open("https://artskyhome.com/xboot/huaFuJian/downloadImportedHuaFile/","_blank");
    },
    importExcelData(){
      this.importModalVisible = true;
    },
    outputExcelData(){
      window.open("https://artskyhome.com/xboot/zwzRosterUser/export/","_blank");
    },
    changeTab(value){
      this.chooseName = value;
    },
    handleRow(row, index) {
       this.departmentNameData = row.id;
       this.nowSelectData = row;
       this.xiala = 'a';
    },
    handleSelectDep(v) {
      this.searchForm.departmentId = v;
    },
    changePage(v) {
      this.searchForm.pageNumber = v;
      this.getUserList();
      this.clearSelectAll();
    },
    changePageSize(v) {
      this.searchForm.pageSize = v;
      this.getUserList();
    },
    selectDateRange(v) {
      if (v) {
        this.searchForm.startDate = v[0];
        this.searchForm.endDate = v[1];
      }
    },
    changeStatus(e){
      if(e == '在职'){
        this.searchForm.status = 0;
      }else if(e == '离职'){
        this.searchForm.status = -1;
      }else{
        this.searchForm.status = null;
      }
    },
    selectByNameFx(){
      this.getUserList();
    },
    handleSearch() {
      this.searchForm.pageNumber = 1;
      this.searchForm.pageSize = 5;
      this.getUserList();
    },
    handleReset() {
      this.searchForm.systemGuishu = "";
      this.searchForm.mobile = "";
      this.searchForm.jobnumber= "";
      this.tempRuZhiNo = "";
      this.statusTemp = '';
      this.searchForm.ruZhiShiJianE = "";
      this.searchForm.ruZhiShiJianS = "";
      this.searchForm.usersex = "";
      this.searchForm.username = "";
      this.searchForm.status = "0";
      this.searchForm.pageNumber = 1;
      this.searchForm.pageSize = 5;
      this.getUserList();
    },
    changeSort(e) {
      this.searchForm.sort = e.key;
      this.searchForm.order = e.order;
      if (e.order == "normal") {
        this.searchForm.order = "";
      }
      this.getUserList();
    },
    refresh() {
      this.getUserList();
    },
    clearImportData() {
      this.importTableData = [];
      this.importColumns = [];
      this.uploadfile = {};
    },
    showDetail(v) {
      for (let attr in v) {
        if (v[attr] == null) {
          v[attr] = "";
        }
      }
      let str = JSON.stringify(v);
      let data = JSON.parse(str);
      this.form = data;
      this.showType = "0";
      this.showUser = true;
    },
    add() {
      this.showType = "2";
      this.showUser = true;
    },
    addUser() {
      this.showType = "2";
      this.showAddUser = true;
    },
    edit(v) {
      for (let attr in v) {
        if (v[attr] == null) {
          v[attr] = "";
        }
      }
      let str = JSON.stringify(v);
      let data = JSON.parse(str);
      this.form = data;
      this.showType = "1";
      this.showUser = true;
    },
    editUser(v) {
      this.showType = "1";
      this.showAddUser = true;
    },
    remove(v) {
      this.$Modal.confirm({
        title: "确认删除",
        content: "您确认要删除该部门吗?",
        loading: true,
        onOk: () => {
          deleteDingDepartment({ids: v.id}).then(res => {
            this.$Modal.remove();
            if (res.success) {
              this.$Message.success("删除成功");
              this.getUserList();
            }
          });
        }
      });
    },
    showSelect(e) {
      this.exportData = e;
      this.selectList = e;
      this.selectCount = e.length;
    },
    clearSelectAll() {
      this.$refs.table.selectAll(false);
    },
    delAll() {
      if (this.selectCount <= 0) {
        this.$Message.warning("您还未选择要删除的数据");
        return;
      }
      this.$Modal.confirm({
        title: "确认删除",
        content: "您确认要删除所选的数据吗?",
        loading: true,
        onOk: () => {
          let ids = "";
          this.selectList.forEach(function(e) {
            ids += e.id + ",";
          });
          ids = ids.substring(0, ids.length - 1);
          deleteDingDepartment({ids: ids}).then(res => {
            this.$Modal.remove();
            if (res.success) {
              this.$Message.success("删除成功");
              this.clearSelectAll();
              this.getUserList();
            }
          });
        }
      });
    },

    beforeUploadImport(file) {
      this.uploadfile = file;
      const fileExt = file.name
        .split(".")
        .pop()
        .toLocaleLowerCase();
      if (fileExt == "xlsx" || fileExt == "xls") {
        this.readFile(file);
        this.file = file;
      } else {
        this.$Notice.warning({
          title: "文件类型错误",
          desc:
            "所选文件‘ " +
            file.name +
            " ’不是EXCEL文件，请选择后缀为.xlsx或者.xls的EXCEL文件。"
        });
      }
      return false;
    },
    // 读取文件
    readFile(file) {
      this.reading = true;
      const reader = new FileReader();
      reader.readAsArrayBuffer(file);
      reader.onerror = e => {
        this.reading = false;
        this.$Message.error("文件读取出错");
      };
      reader.onload = e => {
        const data = e.target.result;
        const { header, results } = excel.read(data, "array");
        const tableTitle = header.map(item => {
          return { title: item, key: item, minWidth: 100, align: "center" };
        });
        this.importTableData = results;
        this.importColumns = tableTitle;
        this.reading = false;
        this.$Message.success("读取数据成功");
      };
    },
    clearImportData() {
      this.importTableData = [];
      this.importColumns = [];
      this.uploadfile = {};
    },
    importData() {
      this.importLoading = true;
      importHuaExcelData(this.importTableData).then(res => {
        this.importLoading = false;
        if (res.success) {
          this.importModalVisible = false;
          this.getUserList();
          this.$Modal.info({
            title: "导入结果",
            content: res.message
          });
        }
      });
    },
  },
  mounted() {
    this.height = Number(document.documentElement.clientHeight - 230);
    this.init();
    this.mycolumns=this.columns;
  },
  watch : {
    selected:function(newcolumns) {
        let showcolumns = [];
        for ( var i=0;i<this.mycolumns.length;i++) {
          var item=this.mycolumns[i];
          if(item.title==undefined)
            showcolumns.push(item);
          else 
              if(newcolumns.includes(item.title))
                showcolumns.push(item);  
        }
        this.columns=showcolumns;
    }
  }
};
</script>
<style>
    .demo-split{
        height: 800px;
    }
    .demo-split-pane{
        padding: 10px;
    }
</style>