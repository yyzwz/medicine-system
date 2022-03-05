import { getRequest, postRequest } from '@/libs/axios';

export const getAssetsTypeList = (params) => {
    return getRequest('/assetsType/getByPage', params)
}
export const addAssetsType = (params) => {
    return postRequest('/assetsType/insertOrUpdate', params)
}
export const editAssetsType = (params) => {
    return postRequest('/assetsType/insertOrUpdate', params)
}
export const deleteAssetsType = (params) => {
    return postRequest('/assetsType/delByIds', params)
}