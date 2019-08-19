package SQL;

public class SQL {

	public static final String YBBS_INSERT_SQL 
	="insert into ybbs values(seq_ybbs.nextval,?,?,sysdate,seq_ybbs.currval,0,0,?,?)";
	public static final String YBBS_INSERT_REPLY_SQL
	="insert into ybbs values(seq_ybbs.nextval,?,?,sysdate,?,1,0,?,?)";
	public static final String YBBS_SELECT_ALL_SQL
	="select * from ybbs order by grp desc, lvl asc, wdate desc";
	public static final String YBBS_SELECT_BY_NAME_SQL
	="select * from ybbs where productname  like ?";
	public static final String YBBS_SELECT_BY_NO_SQL
	="select * from ybbs where ybbsno=?";
	public static final String YBBS_UPDATE_SQL
	="update ybbs set subject= ?,contents= ? where ybbsno = ?";
	public static final String YBBS_DELETE_SQL
	="delete from ybbs where ybbsno=?";
	public static final String YBBS_VISITED_SQL
	="update ybbs set visited = visited+1 where ybbsno=?";
	
	public static final String ORDERS_INSERT 
	="insert into ORDERS values(SEQ_ORDERS.nextval,?,?,?,?,?,?,SYSDATE)";	
	
	public static final String MEMBER_SELECT_ALL_SQL= "select * from member";	
	public static final String MEMBER_INTSERT_SQL="insert into member values(seq_no.nextval,?,?,?,?)";
	public static final String MEMBER_SEARCH_ID_SQL="select memberid from member where membername=? and email =?";
	public static final String MEMBER_SEARCH_PASSWORD_SQL
	="select password from member where memberid =? and membername=? and email =?";
	public static final String MEMBER_SELECT_BY_ID_SQL="SELECT * FROM MEMBER WHERE MEMBERID = ?";


}
