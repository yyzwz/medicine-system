import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';

export const getInsuranceOne = (params) => {
    return getRequest('/insurance/getOne', params)
}
export const getInsuranceList = (params) => {
    return getRequest('/insurance/getByPage', params)
}
export const getInsuranceCount = (params) => {
    return getRequest('/insurance/count', params)
}
export const addInsurance = (params) => {
    return postRequest('/insurance/insert', params)
}
export const editInsurance = (params) => {
    return postRequest('/insurance/update', params)
}
export const addOrEditInsurance = (params) => {
    return postRequest('/insurance/insertOrUpdate', params)
}
export const deleteInsurance = (params) => {
    return postRequest('/insurance/delByIds', params)
}