#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys


def compare_version(version1, version2):
    """
    检查版本号是否相同，当前版本小于期望版本则进行升级，大于等于则忽略。
    如果 version1 > version2 返回 1，如果 version1 < version2 返回 -1， 除此之外返回 0。
    :param version1: 当前系统存在的版本号
    :param version2: 需要比较的版本号
    :return: 0 or 1
    """
    # 如果两者一样就直接返回0
    if version2 == version1:
        return 0

    # 切割成列表
    version1_ls = version1.split(".")
    version2_ls = version2.split(".")

    """
    为了避免版本号长度不同比如  1.0.8和1.2 我们把版本号要补全都变成相同长度，比如 1.2.0 这样比较的时候循环次数相同
    """
    if len(version1_ls) >= len(version2_ls):
        amount = len(version1_ls) - len(version2_ls)
        for i in range(amount):
            version2_ls.append("0")
    else:
        amount = len(version2_ls) - len(version1_ls)
        for i in range(amount):
            version1_ls.append("0")

    """
    逐位比较版本大小
    """
    for i in range(len(version1_ls)):
        try:
            if len(version1_ls[i]) == len(version2_ls[i]):
                if int(version1_ls[i]) > int(version2_ls[i]):
                    return 1
                elif int(version1_ls[i]) < int(version2_ls[i]):
                    return -1
            else:
                return 0
        except IndexError as err:
            return err
    return 0


def main():
    print(compare_version("0.1", "1.1"))    # 输出: -1
    print(compare_version("1.0.1", "1"))    # 输出: 1
    print(compare_version("7.5.2.4", "7.5.3"))  # 输出: -1
    print(compare_version("1.0.1", "1.001"))    # 输出：0
    print(compare_version("1.0", "1.00"))   # 输出：0


if __name__ == "__main__":
    try:
        main()
    finally:
        sys.exit()
