import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';

// 分页获取数据
export const getMeetingList = (params) => {
    return getRequest('/insurance/getByPage', params)
}
// 添加
export const addMeeting = (params) => {
    return postRequest('/insurance/insertOrUpdate', params)
}
// 编辑
export const editMeeting = (params) => {
    return postRequest('/insurance/insertOrUpdate', params)
}
// 删除
export const deleteMeeting = (params) => {
    return postRequest('/insurance/delByIds', params)
}