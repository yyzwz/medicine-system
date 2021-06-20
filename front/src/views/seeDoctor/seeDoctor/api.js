// 统一请求路径前缀在libs/axios.js中修改
import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';

// 分页获取数据
export const getMeetingList = (params) => {
    return getRequest('/seeDoctor/getByPage', params)
}
// 添加
export const addMeeting = (params) => {
    return postRequest('/seeDoctor/insertOrUpdate', params)
}
// 编辑
export const editMeeting = (params) => {
    return postRequest('/seeDoctor/insertOrUpdate', params)
}
// 删除
export const deleteMeeting = (params) => {
    return postRequest('/seeDoctor/delByIds', params)
}