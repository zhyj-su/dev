package com.zero.springboot.utils.bean;

import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Supplier;

/**
 * @author zhyj
 * @version 1.0
 * @date 2020/9/2 17:44
 */
public class BeanCopyUtils extends BeanUtils {
    public static <S, T> List<T> copyListProperties(List<S> sources, Supplier<T> target) {
        return copyListProperties(sources, target, null);
    }


    public static <S, T> List<T> copyListProperties(List<S> sources, Supplier<T> target, LinkturingBeanUtilsCallBack<S, T> callBack) {
        List<T> list = new ArrayList<>(sources.size());
        for (S source : sources) {
            T t = target.get();
            copyProperties(source, t);
            if (callBack != null) {
                callBack.callBack(source, t);
            }
            list.add(t);
        }
        return list;
    }

    @FunctionalInterface
    public interface LinkturingBeanUtilsCallBack<S, T> {

        void callBack(S t, T s);
    }
}
