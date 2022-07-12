package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import domain.DailyRecord;

public class DailyRecordDaoImpl implements DailyRecordDao {

	private DataSource ds;

	public DailyRecordDaoImpl(DataSource ds) {
		this.ds = ds;
	}

	@Override
	public List<DailyRecord> findNewerRecords(int userId) throws Exception {
		List<DailyRecord> records = new ArrayList<>();
		try (Connection con = ds.getConnection()) {
			String sql = "SELECT * FROM daily_records WHERE user_id = ? " + " ORDER BY registered DESC, id DESC "
					+ " LIMIT 100";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, userId);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				records.add(mapToDailyRecord(rs));
			}
		} catch (Exception e) {
			throw e;
		}
		return records;
	}

	@Override
	public DailyRecord findLatestRecord(int userId) throws Exception {
		DailyRecord record = null;
		try (Connection con = ds.getConnection()) {
			String sql = "SELECT * FROM daily_records WHERE user_id = ? " + " ORDER BY registered DESC, id DESC "
					+ " LIMIT 1";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, userId);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				record = mapToDailyRecord(rs);
			}
		} catch (Exception e) {
			throw e;
		}
		return record;
	}

	@Override
	public void insert(DailyRecord record) throws Exception {
		try (Connection con = ds.getConnection()) {
			String sql = "INSERT INTO daily_records "
					+ " (user_id, weight, walk, jogging, pool, training, ball, other, registered) "
					+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, record.getUserId());
			stmt.setDouble(2, record.getWeight());
			stmt.setInt(3, record.getWalk());
			stmt.setInt(4, record.getJogging());
			stmt.setInt(5, record.getPool());
			stmt.setInt(6, record.getTraining());
			stmt.setInt(7, record.getBall());
			stmt.setInt(8, record.getOther());
			stmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void update(DailyRecord record) throws Exception {
		try (Connection con = ds.getConnection()) {
			String sql = "UPDATE daily_records SET "
					+ " weight = ?, walk = ?, jogging = ?, pool = ?, training = ?, ball = ?, other = ? "
					+ " WHERE id = ? AND user_id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setDouble(1, record.getWeight());
			stmt.setInt(2, record.getWalk());
			stmt.setInt(3, record.getJogging());
			stmt.setInt(4, record.getPool());
			stmt.setInt(5, record.getTraining());
			stmt.setInt(6, record.getBall());
			stmt.setInt(7, record.getOther());
			stmt.setInt(8, record.getId());
			stmt.setInt(9, record.getUserId());
			stmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void delete(int id, int userId) throws Exception {
		try (Connection con = ds.getConnection()) {
			String sql = "DELETE FROM daily_records WHERE id = ? AND user_id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.setInt(2, userId);
			stmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public DailyRecord findById(int id, int userId) throws Exception {
		DailyRecord record = null;
		try (Connection con = ds.getConnection()) {
			String sql = "SELECT * FROM daily_records WHERE id = ? AND user_id = ? ";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.setInt(2, userId);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				record = mapToDailyRecord(rs);
			}
		} catch (Exception e) {
			throw e;
		}
		return record;
	}

	protected DailyRecord mapToDailyRecord(ResultSet rs) throws Exception {
		DailyRecord record = new DailyRecord();
		record.setId(rs.getInt("id"));
		record.setUserId(rs.getInt("user_id"));
		record.setRegistered(rs.getTimestamp("registered"));
		record.setWeight(rs.getDouble("weight"));
		record.setWalk(rs.getInt("walk"));
		record.setJogging(rs.getInt("jogging"));
		record.setPool(rs.getInt("pool"));
		record.setTraining(rs.getInt("training"));
		record.setBall(rs.getInt("ball"));
		record.setOther(rs.getInt("other"));
		return record;
	}

}
