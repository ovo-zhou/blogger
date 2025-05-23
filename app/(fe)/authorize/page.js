"use client";
import { useSearchParams } from "next/navigation";
import { useEffect } from "react";
export default function Authorize() {
  const searchParams = useSearchParams();
  const code = searchParams.get("code");
  const loginOrigin = searchParams.get("loginOrigin");
  // console.log(code, loginOrigin);
  useEffect(() => {
    fetch("/login/api", {
      method: "POST",
      body: JSON.stringify({ code, loginOrigin }),
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((res) => res.json())
      .then((res) => {
        location.href = '/';
      });
  }, [code]);
  if (!code) {
    <div>授权码不存在</div>;
  }
  return <div>登录授权中</div>;
}
