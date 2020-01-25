---
layout: about
title: Topic
author: Árpád Rózsás and Arthur Slobbe
image: assets/images/about/placeholder.png
signature: assets/images/about/signature.png
---

<p class="col-lg-10 mx-auto text-left text-dark">
	With the advancements in probability theory and structural reliability, combined with the increase in computational power, it is now possible to conduct probabilistic analysis of engineering models. However, it is still challenging to perform reliability analysis on complex, realistic engineering applications; for example when non-linear finite element analysis is involved.</p>
<p class="col-lg-10 mx-auto text-left text-dark">
	The reason is that one of the main tasks in reliability analysis is to compute high-dimensional integrals in order to determine the failure probability. This is challenging, because (i) the curse of dimensionality; and (ii) typically we are interested in estimating small probabilities <nobr>(10<sup>-3</sup>–10<sup>-6</sup>)</nobr>.</p>
<p class="col-lg-10 mx-auto text-left text-dark">
	Efficient methods are available to compute failure probabilities if only a single failure mode (SFM) is involved and the number of random variables (≡ dimension of the integral) is moderate (<20). However, problems with multiple failure modes are abundant in practice. For these, many of the efficient methods, which excel in SFM problems, break down and one is often compelled to fall back to more general, but at the same time computationally more demanding methods.</p>
<p class="col-lg-10 mx-auto text-left text-dark">
	Another direction where the methods, which excel in SFM problems, can break down is where the number of random variables increases. This can easily happen when certain properties are modeled as stochastic processes, for instance as random fields. Again, the challenge is that the generally applicable methods, e.g. crude Monte Carlo or directional sampling, necessitates enormous computational capacity to obtain answers in a reasonable time.</p>
<p class="col-lg-10 mx-auto text-left text-dark">
	In both cases there are two possible fronts to tackle the challenges: (a) using “smarter” reliability methods that require fewer evaluations of the expensive engineering models; and (b) “smarter” computational techniques that reduce the computational time for the same number of model evaluations. Just to indicate the possible directions and methods, the following examples are given for (a): advanced simulation techniques (e.g. subset simulation, importance sampling, stratified sampling); surrogate models or response surfaces (e.g. artificial neural networks, kriging, polynomial chaos expansion); advanced discretization of stochastic processes. Examples of possible directions for (b) are: parallelization on CPU and/or GPU, and cloud computing.</p>
<p class="col-lg-10 mx-auto text-left text-dark">
	But how efficient and accurate are these methods and can they be applied for realistic engineering problems? <br>
	The workshop intends to address these questions by providing a forum to share expertise from diverse disciplines in an open and informal atmosphere. 
</p>