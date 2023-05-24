package kr.ac.kopo.mannada.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.kopo.mannada.model.Manna;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.pager.Pager;

public interface MannaDao {

	int total(Pager pager);

	List<Manna> list(Pager pager);

	void add(Manna item);

	Manna item(int id);

	void update(Manna item);

	void delete(int id);

	void deleteJoins(int id);

	void addViewCnt(int id);

	List<User> memberList(int id);

	void addJoin(HashMap<String, Object> map);

	void deleteJoin(HashMap<String, Object> map);

	int joinStatus(Map<String, Object> js);

}
