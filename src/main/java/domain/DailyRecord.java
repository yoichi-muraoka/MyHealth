package domain;

import java.util.Date;

public class DailyRecord {
	
	private Integer id;
	private Integer userId;
	private Date registered;
	private Double weight;
	private Integer walk;
	private Integer jogging;
	private Integer pool;
	private Integer training;
	private Integer ball;
	private Integer other;
	
	// アクセッサ
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Date getRegistered() {
		return registered;
	}
	public void setRegistered(Date registered) {
		this.registered = registered;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public Integer getWalk() {
		return walk;
	}
	public void setWalk(Integer walk) {
		this.walk = walk;
	}
	public Integer getJogging() {
		return jogging;
	}
	public void setJogging(Integer jogging) {
		this.jogging = jogging;
	}
	public Integer getPool() {
		return pool;
	}
	public void setPool(Integer pool) {
		this.pool = pool;
	}
	public Integer getTraining() {
		return training;
	}
	public void setTraining(Integer training) {
		this.training = training;
	}
	public Integer getBall() {
		return ball;
	}
	public void setBall(Integer ball) {
		this.ball = ball;
	}
	public Integer getOther() {
		return other;
	}
	public void setOther(Integer other) {
		this.other = other;
	}

}
