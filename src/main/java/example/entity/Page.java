package example.entity;

import java.util.ArrayList;
import java.util.List;

public class Page<T> {
    private int pageNo ;  //当前页
    private int pageSize; //每一页的数据个数
    private int totalNum; //总数据
    private List<T> list = new ArrayList<T>();  //装数据的集合

    public Page(){

    }

    public Page(int pageNo, int pageSize, int totalNum, List<T> list) {
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.totalNum = totalNum;
        this.list = list;
    }

    public int getPageNo() {
        if(pageNo<1){
            return 1;
        }
        if (pageNo > getTotalPageNum()){
            return  getTotalPageNum();
        }
            return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(int totalNum) {
        this.totalNum = totalNum;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
    //获得总页数
    public int getTotalPageNum(){
        if(totalNum%pageSize == 0){
            return totalNum/pageSize;
        }else {
            return  totalNum/pageSize+1;
        }
    }

    //获取上一页
    public int getPrePage(){
        if(getPageNo()>1){
            return getPageNo()-1;
        }
        return getPageNo();
    }
    //获取下一页
    public int getNextPage(){
        if(getPageNo()<getTotalPageNum()){
            return getPageNo()+1;
        }
        return getPageNo();
    }
}
