import { getRequest, postRequest } from '@/libs/axios';

export const getWarehousingList = (params) => {
    return getRequest('/medicalAssetsWarehousingOrder/getByPage', params)
}
export const addWarehousing = (params) => {
    return postRequest('/medicalAssetsWarehousingOrder/insertOrUpdate', params)
}
export const editWarehousing = (params) => {
    return postRequest('/medicalAssetsWarehousingOrder/insertOrUpdate', params)
}
export const deleteWarehousing = (params) => {
    return postRequest('/medicalAssetsWarehousingOrder/delByIds', params)
}
export const getAssetListData1 = (params) => {
    return getRequest('/medicalAssets/getByPage?natureType=1', params)
}