// 统一请求路径前缀在libs/axios.js中修改
import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';


// Vaptcha ID
export const vaptchaID = "5dce36188713b71e70a41eb7"
// 文件上传接口
export const uploadFile = "/xboot/upload/file"
// 验证码渲染图片接口
export const drawCodeImage = "/xboot/common/captcha/draw/"
// 获取菜单
export const getMenuList = "/xboot/permission/getMenuList"
// 获取数据字典
export const getDictData = "/xboot/dictData/getByType/"
// Websocket
export const ws = "/xboot/ws"

export const getOneElse = (params) => {
    return getRequest('/elseJueSe/getOneElse', params)
}
export const getOneRole = (params) => {
    return getRequest('/role/getOneRole', params)
}
export const selectNo = (params) => {
    return postRequest('/zwzRosterUser/selectNo', params)
}
export const importHuaExcelData = (params) => {
    // return postBodyRequest('/excel/import', params)
    return postBodyRequest('/zwzRosterUser/importData', params)
}
export const getBaoXianById = (params) => {
    return getRequest('/baoXian/getById', params)
}
export const getAllSheBao = (params) => {
    return getRequest('/baoXian/getAllSheBao', params)
}
export const getAllShangBao = (params) => {
    return getRequest('/baoXian/getAllShangBao', params)
}
export const getNong = (params) => {
    return getRequest('/huaGangWei/getNong', params)
}
export const checkTel = (params) => {
    return getRequest('/zwzRosterUser/checkTel', params)
}
export const getCityByIdcard = (params) => {
    return getRequest('/city/getCity', params)
}
export const getAllBaoXian = (params) => {
    return getRequest('/baoXian/getAll', params)
}
export const getAllGangWei = (params) => {
    return getRequest('/profession/getAll', params)
}
export const getAllGuiShu = (params) => {
    return getRequest('/systemGuishu/getAll', params)
}
export const getAllZhiWu = (params) => {
    return getRequest('/zhiWu/getAll', params)
}
export const getAllGangJi = (params) => {
    return getRequest('/gangJi/getAll', params)
}
export const getOneHuaGang = (params) => {
    return getRequest('/huaGangWei/getOneHuaGang', params)
}
export const setHuaGang = (params) => {
    return postRequest('/huaGangWei/insertOrUpdate', params)
}
// 花名册api
// 批量导入全部钉钉数据到数据库
export const getDingUserListData = (params) => {
    return getRequest('/dingUser1/importUserByDingDing', params)
}
export const getOneHua = (params) => {
    return getRequest('/zwzRosterUser/get', params)
}
export const getGuiShuList = (params) => {
    return getRequest('/zwzRosterUser/getGuiShuList', params)
}
export const getHuaList = (params) => {
    return getRequest('/zwzRosterUser/getByPage', params)
}
export const fu = (params) => {
    return postRequest('/zwzRosterUser/fu', params)
}
export const tui = (params) => {
    return postRequest('/zwzRosterUser/tui', params)
}
export const addHua = (params) => {
    return postRequest('/zwzRosterUser/insertOrUpdate', params)
}
export const deleteHua = (params) => {
    return postRequest('/zwzRosterUser/delByIds', params)
}
// ------------------------------分割线-----------------------------
// ------------------------------分割线-----------------------------
export const getUserByDepId = (params) => {
    return getRequest('/dingUser1/getPageByDepid', params)
}
export const getDepartmentList = (params) => {
    return getRequest('/dingDing/getByPage', params)
}
export const getDepartmentList1 = (params) => {
    return getRequest('/dingding/getDepartmentList', params)
}
export const addDingDingDepartment = (params) => {
    return postRequest('/dingDing/insert', params)
}
export const deleteDingDepartment = (params) => {
    return postRequest('/dingDing/delByIds', params)
}
export const addDingUser = (params) => {
    return postRequest('/dingUser1/insert', params)
}
export const deleteDingUser = (params) => {
    return postRequest('/dingUser1/delByIds', params)
}
export const updateDingUser = (params) => {
    return postRequest('/dingUser1/update', params)
}
export const updateDingDept = (params) => {
    return postRequest('/dingDing/update', params)
}
// ------------------------------分割线-----------------------------
// ------------------------------分割线-----------------------------
// 预算管理api接口 
export const getdYuSuanListData = (params) => {
    return getRequest('/yuSuan/getByPage', params)
}
export const deletedYuSuanListData = (params) => {
    return postRequest('/yuSuan/delByIds', params)
}
export const addYuSuanListData = (params) => {
    return postNoAuthRequest('/yuSuan/insertOrUpdate', params)
}

// ------------------------------分割线-----------------------------
// ------------------------------分割线-----------------------------
// 花名册api接口 
export const getHuaListData = (params) => {
    return getRequest('/zwzRosterUser/getByPage', params)
}
export const deleteHuaListData = (params) => {
    return postRequest('/zwzRosterUser/delByIds', params)
}
export const addHuaListData = (params) => {
    return postNoAuthRequest('/zwzRosterUser/insertOrUpdate', params)
}
export const savequanXian = (params) => {
    return postRequest('/zwzRosterUser/savequanXian', params)
}
export const addHuaOnDing = (params) => {
    return postRequest('/zwzRosterUser/addHuaOnDing', params)
}
export const newaddHuaOnDing = (params) => {
    return postRequest('/zwzRosterUser/newaddHuaOnDing', params)
}
export const newaddHuaOnDing1 = (params) => {
    return postRequest('/zwzRosterUser/newaddHuaOnDing1', params)
}
export const editHuaOnDing = (params) => {
    return postRequest('/zwzRosterUser/editHuaOnDing', params)
}

// 附件
export const getSystemMessageTest = (params) => {
    return getRequest('/systemNotice/getByPage', params)
}


// ------------------------------分割线-----------------------------
// ------------------------------分割线-----------------------------
// 附件
export const getFuJianData = (params) => {
    return getRequest('/huaFuJian/getByPage', params)
}
export const addFuJian = (params) => {
    return postRequest('/huaFuJian/insertOrUpdate', params)
}
export const deleteFuJian = (params) => {
    return postRequest('/huaFuJian/delByIds', params)
}
// ------------------------------分割线-----------------------------
export const deleteSystemMessage = (params) => {
    return postRequest('/systemNotice/delByIds', params)
}
export const addSystemMessage = (params) => {
    return postNoAuthRequest('/systemNotice/insertOrUpdate', params)
}

// ------------------------------分割线-----------------------------
// ------------------------------分割线-----------------------------
//档案管理
export const getdangAnList = (params) => {
    return getRequest('/dangAn/getByPage', params)
}
export const deletedangAn = (params) => {
    return postRequest('/dangAn/delByIds', params)
}
export const adddangAn = (params) => {
    return postNoAuthRequest('/dangAn/insertOrUpdate', params)
}


// ------------------------------分割线-----------------------------
// 接待管理 （新闻管理）
export const getReceptionList = (params) => {
    return getRequest('/reception/getByPage', params)
}
export const deleteReception = (params) => {
    return postRequest('/reception/delByIds', params)
}
export const addReception = (params) => {
    return postNoAuthRequest('/reception/insertOrUpdate', params)
}



// ------------------------------分割线-----------------------------
// meeting 会议 
export const getMeetingList = (params) => {
    return getRequest('/meeting/getByPage', params)
}
export const deleteMeeting = (params) => {
    return postRequest('/meeting/delByIds', params)
}
export const addMeeting = (params) => {
    return postNoAuthRequest('/meeting/insertOrUpdate', params)
}




// ------------------------------分割线-----------------------------
// ------------------------------分割线-----------------------------
export const getStrTest = (params) => {
    return getRequest('/student/test', params)
}
export const addStudentUserTest = (params) => {
    return postNoAuthRequest('/student/insertOrUpdate', params)
}
// 获取用户数据 多条件
export const getZwzUserListData = (params) => {
    return getRequest('/student/getByPage', params)
}
// 删除用户
export const deleteZwzUser = (params) => {
    return postRequest('/student/delByIds', params)
}
// 编辑用户
export const editZwzUser = (params) => {
    return postRequest('/student/insertOrUpdate', params)
}
export const addStudentGradeTest = (params) => {
    return postNoAuthRequest('/studentGrade/insertOrUpdate', params)
}
export const deleteStudentGradeTest = (params) => {
    return postRequest('/studentGrade/delByIds', params)
}
export const editStudentGradeTest = (params) => {
    return postRequest('/studentGrade/insertOrUpdate', params)
}
export const getStudentGradeListData = (params) => {
    return getRequest('/studentGrade/getByPage', params)
}
export const getStudentDuoGradeListData = (params) => {
    return getRequest('/studentGrade/getStudentGradeByPage', params)
}

// ------------------------------分割线-----------------------------
// ------------------------------分割线-----------------------------
// ------------------------------分割线-----------------------------


// 登陆
export const login = (params) => {
    return postNoAuthRequest('/login', params)
}
// 获取用户登录信息
export const userInfo = (params) => {
    return getRequest('/user/info', params)
}
// 注册
export const regist = (params) => {
    return postNoAuthRequest('/user/regist', params)
}
// 初始化验证码
export const initCaptcha = (params) => {
    return getNoAuthRequest('/common/captcha/init', params)
}
// 发送登录短信验证码
export const sendLoginSms = (mobile, params) => {
    return getNoAuthRequest(`/common/captcha/sendLoginSms/${mobile}`, params)
}
// 发送注册短信验证码
export const sendRegistSms = (mobile, params) => {
    return getNoAuthRequest(`/common/captcha/sendRegistSms/${mobile}`, params)
}
// 发送重置密码短信验证码
export const sendResetSms = (mobile, params) => {
    return getNoAuthRequest(`/common/captcha/sendResetSms/${mobile}`, params)
}
// 发送修改绑定手机短信验证码
export const sendEditMobileSms = (mobile, params) => {
    return getRequest(`/common/captcha/sendEditMobileSms/${mobile}`, params)
}
// 通过手机重置密码
export const resetByMobile = (params) => {
    return postNoAuthRequest('/user/resetByMobile', params)
}
// 发送重置密码邮件验证码
export const sendResetEmail = (email, params) => {
    return getNoAuthRequest(`/email/sendResetCode/${email}`, params)
}
// 发送修改绑定邮件验证码
export const sendEditEmail = (email, params) => {
    return getRequest(`/email/sendEditCode/${email}`, params)
}
// 通过邮件重置密码
export const resetByEmail = (params) => {
    return postNoAuthRequest('/email/resetByEmail', params)
}
// 短信验证码登录
export const smsLogin = (params) => {
    return postRequest('/user/smsLogin', params)
}
// IP天气信息
export const ipInfo = (params) => {
    return getRequest('/common/ip/info', params)
}
// 个人中心编辑
export const userInfoEdit = (params) => {
    return postRequest('/user/edit', params)
}
// 个人中心发送修改邮箱验证邮件
export const sendCodeEmail = (email, params) => {
    return getRequest(`/email/sendCode/${email}`, params)
}
// 个人中心发送修改邮箱验证邮件
export const editEmail = (params) => {
    return postRequest('/email/editEmail', params)
}
// 个人中心修改密码
export const changePass = (params) => {
    return postRequest('/user/modifyPass', params)
}
// 个人中心修改手机
export const changeMobile = (params) => {
    return postRequest('/user/changeMobile', params)
}
// 解锁
export const unlock = (params) => {
    return postRequest('/user/unlock', params)
}
// 获取公告
export const getNotice = (params) => {
    return getNoAuthRequest('/setting/notice', params)
}



// github登录
export const githubLogin = (params) => {
    return getNoAuthRequest('/social/github/login', params)
}
// qq登录
export const qqLogin = (params) => {
    return getNoAuthRequest('/social/qq/login', params)
}
// 微博登录
export const weiboLogin = (params) => {
    return getNoAuthRequest('/social/weibo/login', params)
}
// 微信登录
export const wechatLogin = (params) => {
    return getNoAuthRequest('/social/wechat/login', params)
}
// 绑定账号
export const relate = (params) => {
    return postNoAuthRequest('/social/relate', params)
}
// 获取JWT
export const getJWT = (params) => {
    return getNoAuthRequest('/social/getJWT', params)
}



// 获取绑定账号信息
export const relatedInfo = (username, params) => {
    return getRequest(`/relate/getRelatedInfo/${username}`, params)
}
// 解绑账号
export const unRelate = (params) => {
    return postRequest('/relate/delByIds', params)
}
// 分页获取绑定账号信息
export const getRelatedListData = (params) => {
    return getRequest('/relate/findByCondition', params)
}

// 获取学生数据 多条件
export const getStudentListData = (params) => {
    return getRequest('/student/getByCondition', params)
}

// 获取用户数据 多条件
export const getUserListData = (params) => {
    return getRequest('/user/getByCondition', params)
}
// 通过用户名搜索
export const searchUserByName = (username, params) => {
    return getRequest('/user/searchByName/'+username, params)
}
// 获取全部用户数据
export const getAllUserData = (params) => {
    return getRequest('/user/getAll', params)
}
// 通过部门获取全部用户数据
export const getUserByDepartmentId = (id, params) => {
    return getRequest(`/user/getByDepartmentId/${id}`, params)
}
// 添加用户
export const addUser = (params) => {
    return postRequest('/user/admin/add', params)
}
// 编辑用户
export const editUser = (params) => {
    return postRequest('/user/admin/edit', params)
}
// 启用用户
export const enableUser = (id, params) => {
    return postRequest(`/user/admin/enable/${id}`, params)
}
// 禁用用户
export const disableUser = (id, params) => {
    return postRequest(`/user/admin/disable/${id}`, params)
}
// 删除用户
export const deleteUser = (params) => {
    return postRequest('/user/delByIds', params)
}
// 导入用户
export const importUserData = (params) => {
    return postBodyRequest('/user/importData', params)
}
// 重置用户密码
export const resetUserPass = (params) => {
    return postRequest('/user/resetPass', params)
}



// 获取一级部门
export const initDepartment = (params) => {
    return getRequest('/department/getByParentId/0', params)
}
// 加载部门子级数据
export const loadDepartment = (id, params) => {
    return getRequest(`/department/getByParentId/${id}`, params)
}
// 添加部门
export const addDepartment = (params) => {
    return postRequest('/department/add', params)
}
// 编辑部门
export const editDepartment = (params) => {
    return postRequest('/department/edit', params)
}
// 删除部门
export const deleteDepartment = (params) => {
    return postRequest('/department/delByIds', params)
}
// 搜索部门
export const searchDepartment = (params) => {
    return getRequest('/department/search', params)
}



// 获取全部角色数据
export const getAllRoleList = (params) => {
    return getRequest('/role/getAllList', params)
}
// 分页获取角色数据
export const getRoleList = (params) => {
    return getRequest('/role/getAllByPage', params)
}
// 添加角色
export const addRole = (params) => {
    return postRequest('/role/save', params)
}
// 编辑角色
export const editRole = (params) => {
    return postRequest('/role/edit', params)
}
// 设为或取消注册角色
export const setDefaultRole = (params) => {
    return postRequest('/role/setDefault', params)
}
// 分配角色权限
export const editRolePerm = (params) => {
    return postRequest('/role/editRolePerm', params)
}
// 分配角色数据权限
export const editRoleDep = (params) => {
    return postRequest('/role/editRoleDep', params)
}
// 删除角色
export const deleteRole = (params) => {
    return postRequest('/role/delByIds', params)
}



// 获取全部权限数据
export const getAllPermissionList = (params) => {
    return getRequest('/permission/getAllList', params)
}
// 添加权限
export const addPermission = (params) => {
    return postRequest('/permission/add', params)
}
// 编辑权限
export const editPermission = (params) => {
    return postRequest('/permission/edit', params)
}
// 删除权限
export const deletePermission = (params) => {
    return postRequest('/permission/delByIds', params)
}
// 搜索权限
export const searchPermission = (params) => {
    return getRequest('/permission/search', params)
}



// 获取全部字典
export const getAllDictList = (params) => {
    return getRequest('/dict/getAll', params)
}
// 添加字典
export const addDict = (params) => {
    return postRequest('/dict/add', params)
}
// 编辑字典
export const editDict = (params) => {
    return postRequest('/dict/edit', params)
}
// 删除字典
export const deleteDict = (params) => {
    return postRequest('/dict/delByIds', params)
}
// 搜索字典
export const searchDict = (params) => {
    return getRequest('/dict/search', params)
}
// 获取全部字典数据
export const getAllDictDataList = (params) => {
    return getRequest('/dictData/getByCondition', params)
}
// 添加字典数据
export const addDictData = (params) => {
    return postRequest('/dictData/add', params)
}
// 编辑字典数据
export const editDictData = (params) => {
    return postRequest('/dictData/edit', params)
}
// 删除字典数据
export const deleteData = (params) => {
    return postRequest('/dictData/delByIds', params)
}
// 通过类型获取字典数据
export const getDictDataByType = (type, params) => {
    return getRequest(`/dictData/getByType/${type}`, params)
}



// 分页获取日志数据
export const getLogListData = (params) => {
    return getRequest('/log/getAllByPage', params)
}
// 删除日志
export const deleteLog = (params) => {
    return postRequest('/log/delByIds', params)
}
// 清空日志
export const deleteAllLog = (params) => {
    return postRequest('/log/delAll', params)
}


// 分页获取Redis数据
export const getRedisData = (params) => {
    return getRequest('/redis/getAllByPage', params)
}
// 通过key获取Redis信息
export const getRedisByKey = (key, params) => {
    return getRequest(`/redis/getByKey/${key}`, params)
}
// 获取Redis键值数量
export const getRedisKeySize = (params) => {
    return getRequest('/redis/getKeySize', params)
}
// 获取Redis内存
export const getRedisMemory = (params) => {
    return getRequest('/redis/getMemory', params)
}
// 获取Redis信息
export const getRedisInfo = (params) => {
    return getRequest('/redis/info', params)
}
// 添加编辑Redis
export const saveRedis = (params) => {
    return postRequest('/redis/save', params)
}
// 删除Redis
export const deleteRedis = (params) => {
    return postRequest('/redis/delByKeys', params)
}
// 清空Redis
export const deleteAllRedis = (params) => {
    return postRequest('/redis/delAll', params)
}



// 分页获取定时任务数据
export const getQuartzListData = (params) => {
    return getRequest('/quartzJob/getAllByPage', params)
}
// 添加定时任务
export const addQuartz = (params) => {
    return postRequest('/quartzJob/add', params)
}
// 编辑定时任务
export const editQuartz = (params) => {
    return postRequest('/quartzJob/edit', params)
}
// 暂停定时任务
export const pauseQuartz = (params) => {
    return postRequest('/quartzJob/pause', params)
}
// 恢复定时任务
export const resumeQuartz = (params) => {
    return postRequest('/quartzJob/resume', params)
}
// 删除定时任务
export const deleteQuartz = (params) => {
    return postRequest('/quartzJob/delByIds', params)
}



// 分页获取消息数据
export const getMessageData = (params) => {
    return getRequest('/message/getByCondition', params)
}
// 获取单个消息详情
export const getMessageDataById = (id, params) => {
    return getRequest(`/message/get/${id}`, params)
}
// 添加消息
export const addMessage = (params) => {
    return postRequest('/message/add', params)
}
// 编辑消息
export const editMessage = (params) => {
    return postRequest('/message/edit', params)
}
// 删除消息
export const deleteMessage = (params) => {
    return postRequest('/message/delByIds', params)
}
// 分页获取消息推送数据
export const getMessageSendData = (params) => {
    return getRequest('/messageSend/getByCondition', params)
}
// 编辑发送消息
export const editMessageSend = (params) => {
    return putRequest('/messageSend/update', params)
}
// 删除发送消息
export const deleteMessageSend = (params) => {
    return postRequest('/messageSend/delByIds', params)
}



// 分页获取文件数据
export const getFileListData = (params) => {
    return getRequest('/file/getByCondition', params)
}
// 复制文件
export const copyFile = (params) => {
    return postRequest('/file/copy', params)
}
// 重命名文件
export const renameFile = (params) => {
    return postRequest('/file/rename', params)
}
// 删除文件
export const deleteFile = (params) => {
    return postRequest('/file/delete', params)
}
// 下载文件
export const aliDownloadFile = (fKey, params) => {
    return getRequest(`/file/ali/download/${fKey}`, params)
}


// 检查oss配置
export const checkOssSet = (params) => {
    return getRequest('/setting/oss/check', params)
}
// 获取oss配置
export const getOssSet = (serviceName, params) => {
    return getRequest(`/setting/oss/${serviceName}`, params)
}
// 编辑oss配置
export const editOssSet = (params) => {
    return postRequest('/setting/oss/set', params)
}
// 获取sms配置
export const getSmsSet = (serviceName, params) => {
    return getRequest(`/setting/sms/${serviceName}`, params)
}
// 获取sms模板code
export const getSmsTemplateCode = (type, params) => {
    return getRequest(`/setting/sms/templateCode/${type}`, params)
}
// 编辑sms配置
export const editSmsSet = (params) => {
    return postRequest('/setting/sms/set', params)
}
// 获取email配置
export const getEmailSet = (serviceName, params) => {
    return getRequest('/setting/email', params)
}
// 编辑email配置
export const editEmailSet = (params) => {
    return postRequest('/setting/email/set', params)
}
// 获取vaptcha配置
export const getVaptchaSet = (params) => {
    return getRequest('/setting/vaptcha', params)
}
// 编辑vaptcha配置
export const editVaptchaSet = (params) => {
    return postRequest('/setting/vaptcha/set', params)
}
// 获取vaptcha配置
export const getOtherSet = (params) => {
    return getRequest('/setting/other', params)
}
// 编辑other配置
export const editOtherSet = (params) => {
    return postRequest('/setting/other/set', params)
}
// 获取notice配置
export const getNoticeSet = (params) => {
    return getRequest('/setting/notice', params)
}
// 编辑notice配置
export const editNoticeSet = (params) => {
    return postRequest('/setting/notice/set', params)
}
// 查看私密配置
export const seeSecretSet = (settingName, params) => {
    return getRequest(`/setting/seeSecret/${settingName}`, params)
}



// 表格生成
export const generateTable = (name, rowNum, params) => {
    return postBodyRequest(`/generate/table/${name}/${rowNum}`, params)
}
// 树生成
export const generateTree = (name, rowNum, params) => {
    return postBodyRequest(`/generate/tree/${name}/${rowNum}`, params)
}
// 通过实体类生成Vue代码Json数据
export const getEntityData = (path, params) => {
    return getRequest(`/generate/getEntityData/${path}`, params)
}



// base64上传
export const base64Upload = (params) => {
    return postRequest('/upload/file', params)
}