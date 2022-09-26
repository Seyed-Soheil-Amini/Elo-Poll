
	var xhr = new XMLHttpRequest();
	var wonName;
	var wonCompany;
	var wonStock;
	var wonRate;
	var wonId;
	var lossItem;
	var lossName;
	var lossCompany;
	var lossStock;
	var lossRate;
	var lossId;
	function change(j)
	{
		if(j == 'right'){
			wonName = "Rname";
			wonCompany = "Rcompany";
			wonStock = "Rstock";
			wonRate = "Rrate";
			wonId = "Rid";
			lossItem = "itemLeft";
			lossName = "Lname";
			lossCompany = "Lcompany";
			lossStock = "Lstock";
			lossRate = "Lrate";
			lossId = "Lid";
		}else{
			wonName = "Lname";
			wonCompany = "Lcompany";
			wonStock = "Lstock";
			wonRate = "Lrate";
			wonId = "Lid";
			lossItem = "itemRight";
			lossName = "Rname";
			lossCompany = "Rcompany";
			lossStock = "Rstock";
			lossRate = "Rrate";
			lossId = "Rid";
		}
		var nameW = document.getElementById(wonName).innerText;
		var companyW = document.getElementById(wonCompany).innerText;
		var stockW = document.getElementById(wonStock).innerText;
		var rateW = document.getElementById(wonRate).innerText;
		var idW = document.getElementById(wonId).innerText;
		var nameL = document.getElementById(lossName).innerText;
		var companyL = document.getElementById(lossCompany).innerText;
		var stockL = document.getElementById(lossStock).innerText;
		var rateL = document.getElementById(lossRate).innerText;
		var idL = document.getElementById(lossId).innerText;
		var Ea = (1/(1+Math.pow(10,(Math.abs((rateW - rateL))/(400.0)))));
		xhr.onreadystatechange = function()
		{
			if(xhr.readyState == 4 && xhr.status == 200){
				const responseArray = xhr.responseText.substr(1,(xhr.responseText.length-2)).split("_");
					document.getElementById(lossName).innerHTML = responseArray[0];
					document.getElementById(lossCompany).innerHTML = responseArray[1];
					document.getElementById(lossStock).innerHTML = responseArray[2];
					document.getElementById(lossRate).innerHTML = responseArray[3];
					document.getElementById(lossId).innerHTML = responseArray[4];
			}
		}
		xhr.open("post","Elo.php?",true);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send('&wonName=' + nameW + '&wonCompany=' + companyW + '&wonStock=' + stockW + '&wonRate=' + rateW
			+ '&wonId=' + idW + '&lossName=' + nameL + '&lossCompany=' + companyL + '&lossStock=' + stockL + 
			'&lossRate=' + rateL + '&lossId=' + idL + '&Ea=' + Ea);
	}

