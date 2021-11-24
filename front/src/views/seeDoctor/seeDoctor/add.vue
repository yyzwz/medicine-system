<template>
<div>
    <Card>
        <div slot="title">
            <div class="edit-head">
                <a @click="close" class="back-title">
                    <Icon type="ios-arrow-back" />返回
                </a>
                <div class="head-name">添加</div>
                <span></span>
                <a @click="close" class="window-close">
                    <Icon type="ios-close" size="31" class="ivu-icon-ios-close" />
                </a>
            </div>
        </div>
        <Form ref="form" :model="form" :label-width="150" :rules="formValidate" label-position="left">
            <Row :gutter="32">
                <Col span="12">
                <FormItem label="看病者">
                    <span style="color:#f00;font-size:22px;">{{nowUser}}</span>
                    <userChoose @on-change="getOneUserData"></userChoose>
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="手术">
                    <span style="color:#f00;font-size:22px;">{{nowMedicine}}</span>
                    <medicineChoose @on-change="getMedicineData"></medicineChoose>
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="诊断原价" prop="priceOld">
                    <Input v-model="form.priceOld" clearable @on-change="changePrice" />
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="门诊类型" prop="type">
                    <Select v-model="form.type" @on-change="changePrice">
                        <Option v-for="(item, i) in this.$store.state.dict.examineType" :key="i" :value="item.value">{{item.title}}</Option>
                    </Select>
                </FormItem>
                </Col>
            </Row>
            <Divider><span style="color:#f00;font-size:16px;">以下信息自动带出</span></Divider>
            <Row :gutter="32">
                <Col span="12">
                <FormItem label="保险名称" prop="price">
                    <Input v-model="form.name" readonly />
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="余额" prop="price">
                    <Input v-model="form.balance" readonly />
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="一级手术自付%" prop="price">
                    <Input v-model="dazheList.one" readonly />
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="A类大病自付%" prop="price">
                    <Input v-model="dazheList.big" readonly />
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="二级手术自付%" prop="price">
                    <Input v-model="dazheList.two" readonly />
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="B类大病自付%" prop="price">
                    <Input v-model="dazheList.common" readonly />
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="三级手术自付%" prop="price">
                    <Input v-model="dazheList.three" readonly />
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="C类大病自付%" prop="price">
                    <Input v-model="dazheList.mine" readonly />
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="诊断抵扣" prop="priceYou">
                    <Input v-model="form.priceYou" readonly />
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="诊断费用" prop="price">
                    <Input v-model="form.price" clearable readonly />
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="手术原价" prop="medicineOld">
                    <Input v-model="form.medicineOld" clearable readonly />
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="手术抵扣" prop="priceDiscount">
                    <Input v-model="form.priceDiscount" clearable readonly />
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="手术费用" prop="medicinePrice">
                    <Input v-model="form.medicinePrice" clearable readonly />
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="费用总计" prop="priceSum">
                    <Input v-model="form.priceSum" clearable readonly />
                </FormItem>
                </Col>
                <Col span="12">
                <FormItem label="卡内节余" prop="balanceNew">
                    <Input v-model="form.balanceNew" clearable readonly />
                </FormItem>
                </Col>
            </Row>
            <Form-item class="br">
                <Button @click="handleSubmit" :loading="submitLoading" type="primary">提交并保存</Button>
                <Button @click="handleReset">重置</Button>
                <Button type="dashed" @click="close">关闭</Button>
            </Form-item>
        </Form>
    </Card>
</div>
</template>

<script>
import {
    getInsuranceOne
} from "@/api/index";
import {
    addMeeting
} from "./api.js";
import userChoose from './userChoose.vue';
import medicineChoose from './medicineChoose.vue';
export default {
    name: "add",
    components: {
        userChoose,
        medicineChoose
    },
    data() {
        return {
            nowMedicine: '尚未选择手术',
            nowUser: '尚未选择患者',
            submitLoading: false, // 表单提交状态
            form: { // 添加或编辑表单对象初始化数据
                userId: "",
                price: 0,
                priceSum: 0,
                medicinePrice: '',
                type: '',
                balance: 0,
                priceOld: 0,
                price: 0,
                priceYou: 0,
            },
            // 表单验证规则
            formValidate: {
                name: [{
                    required: true,
                    message: "不能为空",
                    trigger: "blur"
                }],
                peopleNum: [{
                    type: "number",
                    required: true,
                    message: "不能为空",
                    trigger: "blur"
                }],
                zuoBiao: [{
                    required: true,
                    message: "不能为空",
                    trigger: "blur"
                }],
                guiGe: [{
                    required: true,
                    message: "不能为空",
                    trigger: "blur"
                }],
                haoCai: [{
                    required: true,
                    message: "不能为空",
                    trigger: "blur"
                }],
                manger: [{
                    required: true,
                    message: "不能为空",
                    trigger: "blur"
                }],
            },
            userColumns: [{
                    type: "selection",
                    width: 55,
                    align: "center",
                    fixed: "left"
                },
                {
                    title: "姓名",
                    key: "name",
                    width: 100,
                    sortable: true
                },
                {
                    title: "联系电话",
                    key: "mobile",
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
            shiOrLing: '',
            isImportHuaData: false,
            huasearchForm: {
                pageNumber: 1,
                pageSize: 10,
                username: ""
            },
            exportHuaData: [],
            selectHuaList: [],
            selectHuaCount: [],
            huaData: [], //花名册组件的数据
            dazheList: {
                one: 1,
                two: 1,
                three: 1,
                common: 1,
                mine: 1,
                big: 1,
                name: '未选择'
            },
        };
    },
    methods: {
        init() {},
        getOneUserData(e) {
            var that = this;
            // console.log(e);
            this.nowUser = e.name;
            this.form.userName = e.name;
            this.form.userId = e.id;
            this.form.balance = e.balance;
            getInsuranceOne({
                id: e.insuranceType
            }).then(res => {
                // console.log(res);
                that.dazheList = res.result;
                that.dazheList.one = 100 - parseInt(that.dazheList.one);
                that.dazheList.two = 100 - parseInt(that.dazheList.two);
                that.dazheList.three = 100 - parseInt(that.dazheList.three);
                // that.dazheList.mine = that.accAdd(that.dazheList.mine,0.1);
                // that.dazheList.common = that.accAdd(that.dazheList.common,0.1);
                // that.dazheList.big = that.accAdd(that.dazheList.big,0.1);
                that.dazheList.mine = 100 - parseInt(that.dazheList.mine);
                that.dazheList.common = 100 - parseInt(that.dazheList.common);
                that.dazheList.big = 100 - parseInt(that.dazheList.big);
                that.form.name = that.dazheList.name;
                // console.log(that.dazheList);
            })
        },
        getMedicineData(e) {
            var that = this;
            var priceNum = 0;
            var medicineOldPrice = 0;
            // console.log(e);
            that.nowMedicine = "";
            e.forEach(function (ee) {
                that.nowMedicine += '(' + ee.name + ')=' + ee.number + '次*' + ee.price;
                if (ee.type == '一级手术') priceNum += ee.number * ee.price * that.dazheList.one / 100.0;
                else if (ee.type == '二级手术') priceNum += ee.number * ee.price * that.dazheList.two / 100.0;
                else if (ee.type == '三级手术') priceNum += ee.number * ee.price * that.dazheList.three / 100.0;
                else priceNum += ee.number * ee.price;
                medicineOldPrice += ee.number * ee.price;
            })
            that.form.medicineOld = this.accAdd(medicineOldPrice, "0.0");
            that.form.priceDiscount = this.accAdd(medicineOldPrice, "-" + priceNum);
            that.form.medicinePrice = priceNum;
            that.form.priceSum = this.accAdd(this.form.price, this.form.medicinePrice);
            that.form.balanceNew = this.accAdd(this.form.balance, "-" + this.form.priceSum);
        },
        changePrice() {
            this.form.type;
            this.form.priceOld;
            if (this.form.type == 'C类大病门诊') {
                this.form.price = Number.parseFloat(this.form.priceOld) * this.dazheList.mine / 100.0;
            } else if (this.form.type == 'B类大病门诊') {
                this.form.price = Number.parseFloat(this.form.priceOld) * this.dazheList.common / 100.0;
            } else if (this.form.type == 'A类大病门诊') {
                this.form.price = Number.parseFloat(this.form.priceOld) * this.dazheList.big / 100.0;
            }
            this.form.priceYou = this.accAdd(this.form.priceOld, "-" + this.form.price);
            this.form.priceSum = this.accAdd(this.form.price, this.form.medicinePrice);
            this.form.balanceNew = this.accAdd(this.form.balance, "-" + this.form.priceSum);
        },
        accAdd(arg1, arg2) {
            var r1, r2, m;
            try {
                r1 = arg1.toString().split(".")[1].length
            } catch (e) {
                r1 = 0
            }
            try {
                r2 = arg2.toString().split(".")[1].length
            } catch (e) {
                r2 = 0
            }
            m = Math.pow(10, Math.max(r1, r2))
            return (arg1 * m + arg2 * m) / m
        },
        showHuaModel() {
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
            this.huaselectList.forEach(function (e) {
                ids += e.username + ",";
            });
            ids = ids.substring(0, ids.length - 1);
            this.$Message.success("导入成功");
            this.isImportHuaData = false;
            that.form.manger = ids;
        },
        handleReset() {
            this.$refs.form.resetFields();
        },
        handleSubmit() {
            var that = this;
            var money = this.accAdd(that.form.balance, "-" + that.form.priceSum);
            if (Number.parseFloat(money) < 0.0) {
                this.$Message.error("钱不够了,快去充钱!");
            } else {
                that.form.medicineName = that.nowMedicine;
                this.$refs.form.validate(valid => {
                    if (valid) {
                        addMeeting(this.form).then(res => {
                            this.submitLoading = false;
                            if (res.success) {
                                this.$Message.success("操作成功");
                                this.submited();
                            }
                        });
                    }
                });
            }
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
