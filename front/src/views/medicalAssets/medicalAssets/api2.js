import { getRequest, postRequest } from '@/libs/axios';

export const getAssetsTypeList = (params) => {
    return getRequest('/medicalAssets/getByPage', params)
}
export const addAssetsType = (params) => {
    return postRequest('/medicalAssets/insertOrUpdate', params)
}
export const editAssetsType = (params) => {
    return postRequest('/medicalAssets/insertOrUpdate', params)
}
export const deleteAssetsType = (params) => {
    return postRequest('/medicalAssets/delByIds', params)
}