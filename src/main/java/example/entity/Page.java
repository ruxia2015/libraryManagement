package example.entity;

import java.util.ArrayList;
import java.util.List;

public class Page {
    private int pageNo ;  //当前页
    private int pageSize; //每一页的数据个数
    private int toatalNum; //总数据
    private List<Object> list = new ArrayList<Object>();  //装数据的集合

    public Page(int pageNo, int pageSize, int toatalNum, List<Object> list) {
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.toatalNum = toatalNum;
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

    public int getToatalNum() {
        return toatalNum;
    }

    public void setToatalNum(int toatalNum) {
        this.toatalNum = toatalNum;
    }

    public List<Object> getList() {
        return list;
    }

    public void setList(List<Object> list) {
        this.list = list;
    }
    //获得总页数
    public int getTotalPageNum(){
        if(toatalNum%pageSize == 0){
            return toatalNum%pageSize;
        }else {
            return  toatalNum%pageSize+1;
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
