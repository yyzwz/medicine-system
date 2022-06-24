import { getRequest, postRequest } from '@/libs/axios';

export const getWarehouseOutList = (params) => {
    return getRequest('/medicalAssetsOutboundOrder/getByPage', params)
}
export const addWarehouseOut = (params) => {
    return postRequest('/medicalAssetsOutboundOrder/insertOrUpdate', params)
}
export const editWarehouseOut = (params) => {
    return postRequest('/medicalAssetsOutboundOrder/insertOrUpdate', params)
}
export const deleteWarehouseOut = (params) => {
    return postRequest('/medicalAssetsOutboundOrder/delByIds', params)
}
export const getAssetListData1 = (params) => {
    return getRequest('/medicalAssets/getByPage?natureType=1', params)
}
export const getUserListData = (params) => {
    return getRequest('/myUser/getByPage', params)
}