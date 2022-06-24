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
// 查询全部保险
export const getInsuranceList = (params) => {
    return getRequest('/insurance/getAll', params)
}
// 禁用参保人员
export const disableOne = (params) => {
    return getRequest('/roster/disableOne', params)
}
// 启用参保人员
export const enableOne = (params) => {
    return getRequest('/roster/enableOne', params)
}