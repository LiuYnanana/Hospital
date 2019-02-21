package cn.ly.bean;

import java.util.List;

public class Paging {
	private int page;//当前页
	private int pagesize;//页面数据条数
	private int indexpage = 1;//首页
	private int endpage;//尾页
	private int count;//总数据个数
	private int pagenumber;//总页面数
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getIndexpage() {
	    return indexpage;
	}
	public void setIndexpage(int indexpage) {
		this.indexpage = indexpage;
	}
	public int getEndpage() {
	    return endpage;
	}
	public void setEndpage() {
		this.endpage = pagenumber;
	}
	public int getCount() {
		return count;
    }
	public void setCount(int count) {
		this.count = count;
	}
	public int getPagenumber() {
        return pagenumber;
    }
	public void setPagenumber() {
		this.pagenumber = count % pagesize == 0 ? count / pagesize : count / pagesize + 1;  
	}
}
