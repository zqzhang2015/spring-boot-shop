package com.lhrsite.shop.VO;

import lombok.Data;

import java.util.List;

@Data
public class PageVO<T> {

    // 总页数
    private long totalPage;
    // 每页数量
    private long pageSize = 10;
    // 当前页码
    private long currentPage;
    // 总条数
    private long totalCount;
    // 本页数量
    private long currentNumber;

    private List<T> arr;

    public void init(long totalCount, long currentPage, List<T> arr){
        this.currentPage = currentPage;
        this.arr = arr;
        this.totalCount = totalCount;
        this.totalPage = totalCount / pageSize;
        this.currentNumber = arr.size();
        if (totalCount % pageSize > 0){
            this.totalPage += 1;
        }
    }
}
