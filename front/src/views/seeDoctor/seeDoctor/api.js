import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';

export const getSeeDoctorOne = (params) => {
    return getRequest('/seeDoctor/getOne', params)
}
export const getSeeDoctorList = (params) => {
    return getRequest('/seeDoctor/getByPage', params)
}
export const getSeeDoctorCount = (params) => {
    return getRequest('/seeDoctor/count', params)
}
export const addSeeDoctor = (params) => {
    return postRequest('/seeDoctor/insert', params)
}
export const editSeeDoctor = (params) => {
    return postRequest('/seeDoctor/update', params)
}
export const addOrEditSeeDoctor = (params) => {
    return postRequest('/seeDoctor/insertOrUpdate', params)
}
export const deleteSeeDoctor = (params) => {
    return postRequest('/seeDoctor/delByIds', params)
}
// 查询参保人员档案
export const getRosterList = (params) => {
    return getRequest('/roster/getByPage', params)
}
// 查询药物档案
export const getMedicineList = (params) => {
    return getRequest('/operation/getByPage', params)
}
// 查询单个医疗保险档案
export const getInsuranceOne = (params) => {
    return getRequest('/insurance/getOne', params)
}