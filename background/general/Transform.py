# -*- coding: utf-8 -*-
# !/usr/bin/env python


def list_to_tree(data):
    """
    生成树数据
    :param data: [lsit]
    :return:
    """
    res = {}
    for i, v in enumerate(data):
        v["parent_id"] = v["parent_id"] if v["parent_id"] else 0
        res.setdefault(v["id"], v).update(v)
        res.setdefault(v["parent_id"], {}).setdefault("childs", []).append(v)
    return res[0]["childs"]