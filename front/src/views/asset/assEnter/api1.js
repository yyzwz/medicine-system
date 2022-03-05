import { getRequest, postRequest } from '@/libs/axios';

export const getWarehousingList = (params) => {
    return getRequest('/warehousing/getByPage', params)
}
export const addWarehousing = (params) => {
    return postRequest('/warehousing/insertOrUpdate', params)
}
export const editWarehousing = (params) => {
    return postRequest('/warehousing/insertOrUpdate', params)
}
export const deleteWarehousing = (params) => {
    return postRequest('/warehousing/delByIds', params)
}
export const getAssetListData1 = (params) => {
    return getRequest('/assetsType/getByPage?natureType=1', params)
}