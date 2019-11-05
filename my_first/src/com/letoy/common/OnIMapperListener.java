package com.letoy.common;

import java.sql.ResultSet;
/**
 * 映射监听器接口
 * */
public interface OnIMapperListener<T> {
    public T mapper(ResultSet rs);//flag标记变量  rs返回的结果集 T表示处理完结果集返回值类型，一般返回值的类型是相应的Bean类型
}