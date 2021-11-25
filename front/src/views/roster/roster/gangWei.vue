<template>
<div>
    <!-- <span style="color:#ff0000">当前选择人员：{{form.username}}</span> -->
    <!-- {{departmentNameData}} -->
    <card>
        <div>
            <Form ref="form" :model="form" :rules="formValidate" label-position="top">
                <Row :gutter="32">
                    <Col span="21">
                    <Divider>
                        <Button v-if="!isEdit" type="error" :loading="submitLoading" @click="submit">保存信息</Button>
                        <Button v-if="isEdit" type="error" :loading="submitLoading" @click="beginEdit">开始编辑</Button>
                    </Divider>

                    </Col>
                    <Col span="8">
                    <FormItem label="社保卡号">
                        <Input v-model="form.cardNumber" :readonly="isEdit" />
                    </FormItem>
                    </Col>
                    <Col span="8">
                    <FormItem label="余额">
                        <Input v-model="form.balance" :readonly="isEdit" />
                    </FormItem>
                    </Col>
                    <Col span="8">
                    <FormItem label="保险类型">
                        <Select v-model="form.insuranceType" :disabled="isEdit">
                            <Option v-for="(item, i) in this.insuranceList" :key="i" :value="item.id">{{item.name}}</Option>
                        </Select>
                    </FormItem>
                    </Col>
                </Row>
            </Form>
        </div>
    </card>
</div>
</template>

<script>
import {
    addRoster,
    getRosterOne,
    getAllInsurance
} from '../../../api/index.js';
import {
    validateUsername,
    validateMobile,
    validatePassword
} from "@/libs/validate";
import {
    getCityByIdcard
} from "./index";
// 编辑保安管理范围列表组件
export default {
    name: "anbao-fanwei",
    components: {},
    data() {
        return {
            onePhotoSrc: 'https://artskyhome.com:8082/onePhoto/5c55fd84-d5af-4604-bc2b-5692e3eb4ca2.png',
            isChangeHighstyledate: false,
            isChangeFirststyledate: false,
            firststyledateTemp: '',
            isEdit: true,
            changeBirthday: false,
            birthdayTemp: '请选择生日',
            departmentNameData: '未选择',
            form: {
                id: '未选择',
                jobnumber: '',
                username: '',
                idcard: '',
                mobile: '',
                email: '',
                usersex: '',
                age: '',
                birthday: '',
                jiguan: '',
                workplace: '',
                hukouaddress: '',
                nowaddress: '',
                friendjiname: '',
                friendjireal: '',
                friendjitel: '',
                firststyleschool: '',
                firststyledate: '',
                firststylezy: '',
                highstyleschool: '',
                highstyledate: '',
                highstylezy: '',
                cardid01: '',
                cardid02: '',
                cardid03: '',
                huKou: '',
                minzu: '',
                love: '',
                about: '',
                telpublic: '',
                telsmall: '',
                telprivate: '',
                weixinid: '',
                mianmao: '',
                huKou: '',
                quanXianData: '',
                workplace: '',
                year: '',
                mouth: '',
                day: '',
                createBy: 'admin'
            },
            formValidate: {
                // 表单验证规则
                username: [{
                    required: true,
                    message: "请输入姓名",
                    trigger: "blur"
                }, ],
                mobile: [{
                        required: true,
                        message: "请输入手机号",
                        trigger: "blur"
                    },
                    {
                        validator: validateMobile,
                        trigger: "blur"
                    }
                ]
            },
            canEditGongHao: false,
            editGongHaoRole: false,
            insuranceList: []
        }
    },
    methods: {
        init() {
            this.getAllInsuranceFx();
        },
        getAllInsuranceFx() {
            getAllInsurance().then(res => {
                this.insuranceList = res.result;
            })
        },
        beginEdit() {
            this.isEdit = false;
        },
        changeIdcard() {
            var idcard = this.form.idcard;
            if (idcard.length == 18) {
                // 性别
                var sexNumber = parseInt(idcard[16]);
                if (sexNumber % 2 == 1) {
                    this.form.usersex = "男";
                } else {
                    this.form.usersex = "女";
                }

                // 出生地
                var cityId = idcard.substring(0, 6);
                getCityByIdcard({
                    cityIds: cityId
                }).then(res => {
                    this.form.jiguan = res;
                })
                var birthYear = idcard.substring(6, 10);
                this.form.age = new Date().getFullYear() - birthYear + "";

                // 生日
                var birthday = idcard.substring(6, 10) + "-" +
                    idcard.substring(10, 12) + "-" +
                    idcard.substring(12, 14);
                this.form.birthday = birthday;
                this.form.year = idcard.substring(6, 10);
                this.form.mouth = idcard.substring(10, 12);
                this.form.day = idcard.substring(12, 14);
            }
        },
        getUserList() {
            getRosterOne({
                id: this.departmentNameData
            }).then(res => {
                this.form = res.result;
            })
        },
        changeFirststyledate() {
            this.isChangeFirststyledate = true;
        },
        changeHighstyledate() {
            this.isChangeHighstyledate = true;
        },
        submit() {
            addRoster(this.form).then(res => {
                if (res.success) {
                    this.isEdit = true;
                    this.$emit("on-submit", true);
                }
            })
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
    watch: {
        departmentName: function (newVal, oldVal) {
            this.departmentNameData = newVal;
            this.getUserList();
        },
        isEdit(val) {
            if (val == false && this.editGongHaoRole == true) {
                this.canEditGongHao = true;
            } else {
                this.canEditGongHao = false;
            }
        }
    },

}
</script>

<style>

</style>
