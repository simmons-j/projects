package edu.acc.jee.hubbub.domain;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {

    /**
     * @return the profile
     */
    public String getProfile() {
        return profile;
    }

    /**
     * @param profile the profile to set
     */
    public void setProfile(String profile) {
        this.profile = profile;
    }
    public static final String USERNAME_PATTERN = "^\\w{6,20}$";
    
    private String username;
    private String passhash;
    private Date   joined = new Date();
    private int    profileId;
    private String profile;
    
    public User() {
    }

    public User(String username, String passhash, int profileId) {
        this(username, passhash, new Date(), profileId);
    }

    public User(String username, String passhash, Date joined, int profileId) {
        this.username = username;
        this.passhash = passhash;
        this.joined = joined;
        this.profileId = profileId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasshash() {
        return passhash;
    }

    public void setPasshash(String passhash) {
        this.passhash = passhash;
    }

    public Date getJoined() {
        return joined;
    }

    public void setJoined(Date joined) {
        this.joined = joined;
    }

    public int getProfileId() {
        return profileId;
    }

    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }
    
    @Override
    public String toString() {
        return username;
    }
    
    @Override
    public int hashCode() {
        return username.hashCode();
    }
    
    @Override
    public boolean equals(Object other) {
        if (! (other instanceof User)) return false;
        User otherUser = (User)other;
        return otherUser.username.equals(this.username);
    }
    
}