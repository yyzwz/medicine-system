import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';

export const getExamineOne = (params) => {
    return getRequest('/examine/getOne', params)
}
export const getExamineList = (params) => {
    return getRequest('/examine/getByPage', params)
}
export const getExamineCount = (params) => {
    return getRequest('/examine/count', params)
}
export const addExamine = (params) => {
    return postRequest('/examine/insert', params)
}
export const editExamine = (params) => {
    return postRequest('/examine/update', params)
}
export const addOrEditExamine = (params) => {
    return postRequest('/examine/insertOrUpdate', params)
}
export const deleteExamine = (params) => {
    return postRequest('/examine/delByIds', params)
}
export const pass = (params) => {
    return postRequest('/examine/pass', params)
}
export const notPass = (params) => {
    return postRequest('/examine/notPass', params)
}