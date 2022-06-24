import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';

export const getRosterOne = (params) => {
    return getRequest('/roster/getOne', params)
}
export const getRosterList = (params) => {
    return getRequest('/roster/getByPage', params)
}
export const getRosterCount = (params) => {
    return getRequest('/roster/count', params)
}
export const addRoster = (params) => {
    return postRequest('/roster/insert', params)
}
export const editRoster = (params) => {
    return postRequest('/roster/update', params)
}
export const addOrEditRoster = (params) => {
    return postRequest('/roster/insertOrUpdate', params)
}
export const deleteRoster = (params) => {
    return postRequest('/roster/delByIds', params)
}
// 医保余额充值接口
export const addMoney = (params) => {
    return getRequest('/roster/addMoney', params)
}