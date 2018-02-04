resource "aws_instance" "server" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    security_groups = ["${aws_security_group.gpu.name}"]

    root_block_device {
        volume_type = "${var.volume_type}"
        volume_size = "${var.volume_size}"
        iops = "${var.iops}"
    }

    connection {
        user = "${var.username}"
        private_key = "${file("${var.key_path}")}"
    }

    tags {
        Name = "${var.tagName}"
    }

    volume_tags {
        Name = "${var.tagName}"
    }
}


resource "aws_security_group" "gpu" {
    name = "gpu_test"
    description = "GPU testing"

    // These are for internal and external traffic
    ingress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        self = true
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 0
        to_port = 65535
        protocol = "udp"
        self = true
        cidr_blocks = ["0.0.0.0/0"]
    }

    // These are for maintenance
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    // Notebook
    ingress {
        from_port = 8888
        to_port = 8888
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    // This is for outbound internet access
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "server_address" {
    value = "${aws_instance.server.public_ip}"
}
