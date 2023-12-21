# Define IAM groups
resource "aws_iam_group" "Dev_Team"{
    name = "Dev_Team"
} 
resource "aws_iam_group" "HR_Team"{
    name = "HR_Team"
}
# Define IAM Users
resource "aws_iam_user" "John"{
    name = "John"
    tags = {Dev-Team = true}
}
resource "aws_iam_user" "Sarah"{
    name = "Sarah"
    tags = {Dev-Team = true}
}
resource "aws_iam_user" "Rita"{
    name = "Rita"
    tags = {HR-Team = true}
}
resource "aws_iam_user" "Ted"{
    name = "Ted"
    tags = {HR-Team =true}
}
# Add users to groups
resource "aws_iam_group_membership" "Dev_Team_membership"{
    name = "Dev_Team_membership"
    users = [
        aws_iam_user.John.name,
        aws_iam_user.Sarah.name,
    ]
    group = aws_iam_group.Dev_Team.name
}
resource "aws_iam_group_membership" "HR_Team_membership"{
    name = "HR_Team_membership"
    users = [
        aws_iam_user.Rita.name,
        aws_iam_user.Ted.name,
    ]
    group = aws_iam_group.HR_Team.name
}