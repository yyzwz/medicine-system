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
export const getAssetListData2 = (params) => {
    return getRequest('/medicalAssets/getByPage?natureType=2', params)
}