CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20),
    subscription_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    subscription_status ENUM('active', 'inactive') DEFAULT 'active'
);

CREATE TABLE Campaigns (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    creation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('scheduled', 'sent', 'cancelled') DEFAULT 'scheduled',
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE Emails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    campaign_id INT,
    content TEXT NOT NULL,
    send_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('sent', 'delivered', 'opened', 'clicked', 'bounced') DEFAULT 'sent',
    FOREIGN KEY (campaign_id) REFERENCES Campaigns(id)
);

CREATE TABLE campaign_contact (
    id INT AUTO_INCREMENT PRIMARY KEY,
    campaign_id INT,
    contact_id INT,
    FOREIGN KEY (campaign_id) REFERENCES Campaigns(id),
    FOREIGN KEY (contact_id) REFERENCES Contacts(id)
);
