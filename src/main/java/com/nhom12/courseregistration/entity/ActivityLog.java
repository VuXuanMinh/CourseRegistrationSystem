package com.nhom12.courseregistration.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "activity_logs")
public class ActivityLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(name = "user_type", nullable = false, length = 30)
    private String userType;

    @Column(name = "action", nullable = false, length = 100)
    private String action;

    @Column(name = "action_time", nullable = false)
    private LocalDateTime actionTime;

    // Dùng kiểu String để chứa dữ liệu JSON (hoặc cấu hình kiểu dữ liệu tùy chỉnh nếu cần)
    @Column(name = "detail_data", columnDefinition = "JSON")
    private String detailData;

    @Column(name = "ip_address", length = 45)
    private String ipAddress;

    // --- GETTER VÀ SETTER ---
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }

    public String getUserType() { return userType; }
    public void setUserType(String userType) { this.userType = userType; }

    public String getAction() { return action; }
    public void setAction(String action) { this.action = action; }

    public LocalDateTime getActionTime() { return actionTime; }
    public void setActionTime(LocalDateTime actionTime) { this.actionTime = actionTime; }

    public String getDetailData() { return detailData; }
    public void setDetailData(String detailData) { this.detailData = detailData; }

    public String getIpAddress() { return ipAddress; }
    public void setIpAddress(String ipAddress) { this.ipAddress = ipAddress; }
}
