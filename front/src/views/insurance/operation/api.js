import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';

export const getOperationOne = (params) => {
    return getRequest('/operation/getOne', params)
}
export const getOperationList = (params) => {
    return getRequest('/operation/getByPage', params)
}
export const getOperationCount = (params) => {
    return getRequest('/operation/count', params)
}
export const addOperation = (params) => {
    return postRequest('/operation/insert', params)
}
export const editOperation = (params) => {
    return postRequest('/operation/update', params)
}
export const addOrEditOperation = (params) => {
    return postRequest('/operation/insertOrUpdate', params)
}
export const deleteOperation = (params) => {
    return postRequest('/operation/delByIds', params)
}