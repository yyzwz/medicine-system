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
export const checkTel = (params) => {
    return getRequest('/zwzRosterUser/checkTel', params)
}
export const getCityByIdcard = (params) => {
    return getRequest('/city/getCity', params)
}
export const getGuiShuList = (params) => {
    return getRequest('/zwzRosterUser/getGuiShuList', params)
}
export const getHuaList = (params) => {
    return getRequest('/zwzRosterUser/getByPage', params)
}
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
export const getFuJianData = (params) => {
    return getRequest('/huaFuJian/getByPage', params)
}
export const addFuJian = (params) => {
    return postRequest('/huaFuJian/insertOrUpdate', params)
}
export const deleteFuJian = (params) => {
    return postRequest('/huaFuJian/delByIds', params)
}
export const getMeetingList = (params) => {
    return getRequest('/meeting/getByPage', params)
}
export const deleteMeeting = (params) => {
    return postRequest('/meeting/delByIds', params)
}
export const addMeeting = (params) => {
    return postNoAuthRequest('/meeting/insertOrUpdate', params)
}
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
// IP天气信息
export const ipInfo = (params) => {
    return getRequest('/common/ip/info', params)
}
// 个人中心编辑
export const userInfoEdit = (params) => {
    return postRequest('/user/edit', params)
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
// 获取JWT
export const getJWT = (params) => {
    return getNoAuthRequest('/social/getJWT', params)
}
// 获取绑定账号信息
export const relatedInfo = (username, params) => {
    return getRequest(`/relate/getRelatedInfo/${username}`, params)
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