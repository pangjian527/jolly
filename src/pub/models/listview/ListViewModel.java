package pub.models.listview;

/**
 * Created by IntelliJ IDEA.
 * @author zhuangzhonglong
 * Date: 2008-9-4
 * Time: 1:22:38
 */
public interface ListViewModel {

	String getColTitle(int col);
	Object getCellValue(int row, int col);
	int getRowCount();
	int getColCount();

}
