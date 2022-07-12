package dao;

import java.util.List;

import domain.DailyRecord;

public interface DailyRecordDao {
	
	// 記録を新しい順に取得
	List<DailyRecord> findNewerRecords(int userId) throws Exception;
	DailyRecord findLatestRecord(int userId) throws Exception;
	
	// 記録の追加、編集、削除
	void insert(DailyRecord record) throws Exception; 
	void update(DailyRecord record) throws Exception; 
	void delete(int id, int userId) throws Exception; 

}
