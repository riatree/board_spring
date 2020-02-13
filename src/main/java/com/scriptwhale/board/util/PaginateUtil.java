package com.scriptwhale.board.util;

public class PaginateUtil {

	public static String getPaginate(int pageNo, int total, int numPage, int numBlock, String url) {

		int totalPage = (int) Math.ceil((double) total / numPage);
		int nowBlock = (int) Math.ceil((double) pageNo / numBlock);

		String paginate = "<div class='paginate'>";

		if (total != 0) {
			if (pageNo <= 1) {
				paginate += "<span title=\"이전 페이지 없음\"><i class=\"fa fa-chevron-left\"></i></span>";
			} else {
				paginate += "<a href='" + url + (pageNo - 1)
						+ "' title='이전 페이지로'><i class='fa fa-chevron-left'></i><span class='hidden'>이전 페이지</span></a>";
			} // if end

			for (int i = 1; i <= numBlock; i++) {


				int realPage = ((nowBlock - 1) * numBlock) + i;


				if (realPage == pageNo) {

					paginate += "<strong title=" + pageNo + ">" + pageNo + "</strong>";

				} else {
					paginate += "<a href='" + url+ realPage + "' title='" + realPage + "'>" + realPage
							+ "</a>";

				} // if ~ else end

				if (realPage == totalPage) {
					break;
				} // if end

			} // for end(블록 만들기)

			if (pageNo >= totalPage) {
				paginate += "<span title='다음 페이지 없음'><i class='fa fa-chevron-right'></i></span>";
			} else {
				paginate += "<a href='" + url  + (pageNo + 1)
						+ "' title='다음 페이지로'><i class='fa fa-chevron-right'></i><span class='hidden'>다음 페이지</span></a>";
			} // if end

		} // if end

		paginate += "</div>";

		return paginate;
	}

}
